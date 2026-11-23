#!/usr/bin/env bash
set -euo pipefail

tmp_dir="$(mktemp -d)"
tmp_override="${tmp_dir}/distill-override.yml"
tmp_defaults="${tmp_dir}/distill-defaults.yml"
tmp_site="${tmp_dir}/site"

cleanup() {
  rm -rf "${tmp_dir}"
}
trap cleanup EXIT

cat >"${tmp_override}" <<'YAML'
giscus:
  repo: alshedivat/al-folio
  repo_id: R_kgDOExample
  category: Comments
  category_id: DIC_kwDOExample
al_folio:
  features:
    distill:
      enabled: true
YAML

ruby -rpsych -e '
  defaults = Psych.unsafe_load_file("_config.yml").fetch("defaults", [])
  defaults << {
    "scope" => { "path" => "_posts/2021-07-04-distill.md", "type" => "posts" },
    "values" => { "mermaid" => { "enabled" => true }, "tikzjax" => true }
  }
  puts({ "defaults" => defaults }.to_yaml)
' >"${tmp_defaults}"

bundle exec jekyll build --config "_config.yml,${tmp_override},${tmp_defaults}" -d "${tmp_site}" >/dev/null

distill_page="${tmp_site}/blog/2021/distill/index.html"

if [ ! -f "${distill_page}" ]; then
  echo "distill page was not generated at ${distill_page}" >&2
  exit 1
fi

require_page_content() {
  if ! grep -Fq "$1" "${distill_page}"; then
    echo "distill page missing expected content: $1" >&2
    exit 1
  fi
}

require_page_content 'd-front-matter'
require_page_content '/assets/js/distillpub/template.v2.js'
require_page_content '/assets/js/distillpub/transforms.v2.js'
require_page_content '/assets/js/distillpub/overrides.js'
require_page_content '/assets/al_charts/js/mermaid-setup.js'
require_page_content 'https://cdn.jsdelivr.net/npm/@planktimerr/tikzjax@1.0.8/dist/fonts.css'
require_page_content 'https://cdn.jsdelivr.net/npm/@planktimerr/tikzjax@1.0.8/dist/tikzjax.js'
require_page_content 'id="giscus_thread"'
transforms_runtime="${tmp_site}/assets/js/distillpub/transforms.v2.js"
distill_runtime="$(PATH="$HOME/.rbenv/shims:$PATH" bundle exec ruby -e 'spec = Gem.loaded_specs["al_folio_distill"]; puts(spec ? File.join(spec.full_gem_path, "assets/js/distillpub/transforms.v2.js") : "")')"
if [ -f "${distill_runtime}" ]; then
  # Prefer the packaged gem runtime for deterministic parity checks.
  transforms_runtime="${distill_runtime}"
elif [ ! -f "${transforms_runtime}" ]; then
  echo "distill transforms runtime missing at ${transforms_runtime} (and not found in installed al_folio_distill gem)" >&2
  exit 1
fi

expected_transforms_hash="5d85590f5652b910ab2411019749c83ef5a5a3fbb9b739adc92b4557b6bf3d39"
actual_transforms_hash="$(ruby -rdigest -e 'print Digest::SHA256.file(ARGV[0]).hexdigest' "${transforms_runtime}")"
if [ "${actual_transforms_hash}" != "${expected_transforms_hash}" ]; then
  echo "unexpected distill transforms runtime hash: ${actual_transforms_hash}" >&2
  exit 1
fi

echo "distill integration checks passed"
