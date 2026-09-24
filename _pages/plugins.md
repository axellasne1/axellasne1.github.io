---
layout: page
title: plugins
permalink: /plugins/
nav: false
description: featured and bundled plugin ecosystem catalog for al-folio v1.x
---

# Plugin Ecosystem

<p class="text-lg text-muted-foreground mb-6">
  Explore the growing ecosystem of plugins that extend the capabilities of al-folio v1.x.
  From bundled essentials to community-contributed features, discover how to enhance your site.
</p>

<section class="mb-12">
  <div class="space-y-8">
    
    <!-- Bundled Plugins Section -->
    <div>
      <h2 class="text-2xl font-bold text-foreground mb-6">
        Bundled Plugins
      </h2>
      <p class="text-muted-foreground max-w-2xl">
        These plugins are included by default in new al-folio installations and represent 
        core functionality that most sites will benefit from.
      </p>
      
      {% assign bundled_plugins = site.data.featured_plugins | where: "status", "bundled" %}
      
      {% if bundled_plugins.size == 0 %}
      <p class="text-muted-foreground italic py-8">
        No bundled plugins found in the ecosystem catalog.
      </p>
      {% else %}
      <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {% for plugin in bundled_plugins %}
        <div class="bg-card text-card-foreground rounded-xl border border-border p-6 hover:shadow-lg transition-shadow duration-300 group">
          <div class="space-y-4">
            <div class="flex justify-between items-start mb-2">
              <h3 class="text-lg font-semibold text-foreground group-hover:text-primary transition-colors duration-200">
                {{ plugin.name }}
              </h3>
              <span class="bg-primary/10 text-primary px-3 py-1 rounded text-xs font-medium">
                Bundled
              </span>
            </div>
            
            <div class="space-y-2 text-sm">
              <p class="flex items-center space-x-2 text-muted-foreground">
                <svg class="w-3 h-3 text-muted-foreground" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                </svg>
                <code class="bg-muted/50 text-muted-foreground px-2 py-1 rounded">{{ plugin.gem_name }}</code>
              </p>
              <p class="flex items-center space-x-2 text-muted-foreground">
                <svg class="w-3 h-3 text-muted-foreground" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m2 0a2 2 0 100-4 2 2 0 000 4zm-9 3a2 2 0 100-4 2 2 0 000 4zm8 0a2 2 0 100-4 2 2 0 000 4zm4 0a2 2 0 100-4 2 2 0 000 4m-9 3a2 2 0 100-4 2 2 0 000 4zm8 0a2 2 0 100-4 2 2 0 000 4zm4 0a2 2 0 100-4 2 2 0 000 4m-9 3a2 2 0 1000-4 2 2 0 000 4zm8 0a2 2 0 1000-4 2 2 0 000 4zm4 0a2 2 0 1000-4 2 2 0 000 4"></path>
                </svg>
                <code class="bg-muted/50 text-muted-foreground px-2 py-1 rounded">{{ plugin.jekyll_plugin_id }}</code>
              </p>
              <p class="flex items-center space-x-2 text-muted-foreground">
                <svg class="w-3 h-3 text-muted-foreground" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 4h12M5 21h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                </svg>
                <span class="whitespace-nowrap">
                  {{ plugin.compat.al_folio_min }} – {{ plugin.compat.al_folio_max }}
                </span>
              </p>
              <p class="flex items-center space-x-2 text-muted-foreground">
                <svg class="w-3 h-3 text-muted-foreground" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 2a2 2 0 100-4 2 2 0 00 4zm-6 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2zm8 0c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2z"></path>
                </svg>
                {{ plugin.owner }}
              </p>
            </div>
            
            {% if plugin.demo_path %}
            <div class="mt-3 pt-3 border-t border-border/50">
              <a href="{{ plugin.demo_path }}" class="text-sm font-medium text-primary hover:text-primary/80 transition-colors duration-200 inline-flex items-center space-x-1">
                View Demo
                <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                </svg>
              </a>
            </div>
            {% endif %}
            
            {% if plugin.notes %}
            <div class="mt-3 pt-3 border-t border-border/50">
              <p class="text-xs text-muted-foreground italic">
                {{ plugin.notes }}
              </p>
            </div>
            {% endif %}
          </div>
        </div>
        {% endfor %}
      </div>
      {% endif %}
    </div>
    
    <!-- Featured Plugins Section -->
    <div>
      <h2 class="text-2xl font-bold text-foreground mb-6">
        Featured Plugins
      </h2>
      <p class="text-muted-foreground max-w-2xl">
        Community-contributed plugins that have been reviewed and featured for their 
        quality, usefulness, and compatibility with al-folio.
      </p>
      
      {% assign featured_only_plugins = site.data.featured_plugins | where: "status", "featured" %}
      {% if featured_only_plugins.size == 0 %}
      <p class="text-muted-foreground italic py-8">
        There are no featured-only entries yet.
        <br>
        <a href="https://github.com/alshedivat/al-folio/issues/new?assignees=&labels=plugin+feature+proposal&template=3_plugin_feature_proposal.yml&title=%5BPlugin+Feature+Proposal%5D+%3Cplugin+name%3E" 
           class="btn-primary btn-sm mt-2">
          Propose a Plugin
        </a>
      </p>
      {% else %}
      <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {% for plugin in featured_only_plugins %}
        <div class="bg-card text-card-foreground rounded-xl border border-border p-6 hover:shadow-lg transition-shadow duration-300 group">
          <div class="space-y-4">
            <div class="flex justify-between items-start mb-2">
              <h3 class="text-lg font-semibold text-foreground group-hover:text-primary transition-colors duration-200">
                {{ plugin.name }}
              </h3>
              <span class="bg-muted/50 text-muted-foreground px-3 py-1 rounded text-xs font-medium">
                Featured
              </span>
            </div>
            
            <div class="space-y-2 text-sm">
              <p class="flex items-center space-x-2 text-muted-foreground">
                <svg class="w-3 h-3 text-muted-foreground" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                </svg>
                <code class="bg-muted/50 text-muted-foreground px-2 py-1 rounded">{{ plugin.gem_name }}</code>
              </p>
              <p class="flex items-center space-x-2 text-muted-foreground">
                <svg class="w-3 h-3 text-muted-foreground" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m2 0a2 2 0 100-4 2 2 0 000 4zm-9 3a2 2 0 1000-4 2 2 0 000 4zm8 0a2 2 0 1000-4 2 2 0 000 4zm4 0a2 2 0 1000-4 2 2 0 000 4m-9 3a2 2 0 1000-4 2 2 0 000 4zm8 0a2 2 0 1000-4 2 2 0 000 4zm4 0a2 2 0 1000-4 2 2 0 000 4"></path>
                </svg>
                <code class="bg-muted/50 text-muted-foreground px-2 py-1 rounded">{{ plugin.jekyll_plugin_id }}</code>
              </p>
              <p class="flex items-center space-x-2 text-muted-foreground">
                <svg class="w-3 h-3 text-muted-foreground" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 4h12M5 21h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 00-2-2v10a2 2 0 002 2z"></path>
                </svg>
                <span class="whitespace-nowrap">
                  {{ plugin.compat.al_folio_min }} – {{ plugin.compat.al_folio_max }}
                </span>
              </p>
              <p class="flex items-center space-x-2 text-muted-foreground">
                <svg class="w-3 h-3 text-muted-foreground" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.1 0-2 .9-2 2s.9 2 2 2-.9-2-2-2-.9-2-2-2zm0 2a2 2 0 1000-4 2 2 0 000 4zm-6 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2-2 2zm8 0c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2-2 2z"></path>
                </svg>
                {{ plugin.owner }}
              </p>
            </div>
            
            {% if plugin.demo_path %}
            <div class="mt-3 pt-3 border-t border-border/50">
              <a href="{{ plugin.demo_path }}" class="text-sm font-medium text-primary hover:text-primary/80 transition-colors duration-200 inline-flex items-center space-x-1">
                View Demo
                <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                </svg>
              </a>
            </div>
            {% endif %}
            
            {% if plugin.notes %}
            <div class="mt-3 pt-3 border-t border-border/50">
              <p class="text-xs text-muted-foreground italic">
                {{ plugin.notes }}
              </p>
            </div>
            {% endif %}
          </div>
        </div>
        {% endfor %}
      </div>
      {% endif %}
    </div>
  </div>
</section>

<section class="bg-muted/50">
  <div class="py-12">
    <h2 class="text-2xl font-bold text-foreground mb-6 text-center">
      Contribute to the Ecosystem
    </h2>
    <p class="text-lg text-muted-foreground mb-8 max-w-2xl mx-auto text-center">
      Help grow the al-folio plugin ecosystem by contributing your own plugins or 
      suggesting existing ones for featuring.
    </p>
    
    <div class="flex flex-col items-center gap-4 sm:flex-row sm:justify-center">
      <a href="https://github.com/alshedivat/al-folio/issues/new?assignees=&labels=plugin+feature+proposal&template=3_plugin_feature_proposal.yml&title=%5BPlugin+Feature+Proposal%5D+%3Cplugin+name%3E" 
         class="btn-primary px-6 py-3 rounded-lg font-medium hover:bg-primary/90 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 transition-all duration-200">
        Propose a Plugin for Featuring
      </a>
      
      <a href="https://github.com/alshedivat/al-folio/blob/main/docs/CUSTOMIZE.md#using-plugins" 
         class="btn-outline border border-input bg-transparent px-6 py-3 rounded-lg font-medium hover:bg-accent hover:text-accent-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:opacity-50 transition-all duration-200">
        Learn How to Use Plugins
      </a>
    </div>
  </div>
</section>
