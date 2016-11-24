<div class="category">
	<!-- IF categoryTree.length -->
	<div class=" col-md-9 col-sm-12 col-xs-12">
	<!-- ENDIF categoryTree.length -->

	<!-- IMPORT partials/breadcrumbs.tpl -->

	<!-- IF categoryTree.length -->
	<div class="card description-card clearfix">
		<div
			id="category-{cid}" class="category-header category-header-image category-header-image-{rootCategory.imageClass} pull-left"
			style="
				<!-- IF rootCategory.backgroundImage -->background-image: url({rootCategory.backgroundImage});<!-- ENDIF rootCategory.backgroundImage -->
				color: {rootCategory.color};
			"
		>
			<!-- IF rootCategory.icon -->
			<div><i class="fa {rootCategory.icon} fa-2x"></i></div>
			<!-- ENDIF rootCategory.icon -->
		</div>

		<div class="description">
			{rootCategory.description}
		</div>
	</div>
	<!-- ENDIF categoryTree.length -->

	<div class="card">
		<div class="listview lv-bordered lv-lg">
			<div class="lv-header-alt">
				<div class="title">
					<!-- IF privileges.topics:create -->
					<button id="new_topic" class="btn btn-primary">[[category:new_topic_button]]</button>
					<!-- ELSE -->
						<!-- IF !loggedIn -->
						<a href="{config.relative_path}/login" class="btn btn-primary">[[category:guest-login-post]]</a>
						<!-- ENDIF !loggedIn -->
					<!-- ENDIF privileges.topics:create -->
					<ul class="lv-actions actions" component="category/controls">
						<!-- IMPORT partials/category/watch.tpl -->
						<!-- IMPORT partials/category/tools.tpl -->
						<!-- IMPORT partials/category/sort.tpl -->
					</ul>
				</div>
			</div>
			<!-- IF !topics.length -->
			<div class="alert alert-warning" id="category-no-topics">
				[[category:no_topics]]
			</div>
			<!-- ENDIF !topics.length -->
			<!-- IMPORT partials/topics_list.tpl -->
		</div>
	</div>
	<!-- IF categoryTree.length -->
	</div>
	<div class="col-md-3 col-sm-12 col-xs-12 category-tree">
		<div class="listview lv-bordered lv-lg">
			<div class="lv-body" itemscope itemtype="http://www.schema.org/ItemList">
				<meta itemprop="itemListOrder" content="ascending">
				<ul class="ul-category-tree">
				</ul>
			</div>
		</div>
	</div>
	<!-- ENDIF categoryTree.length -->

	<!-- IF config.usePagination -->
		<!-- IMPORT partials/paginator.tpl -->
	<!-- ENDIF config.usePagination -->
</div>

<!-- IMPORT partials/move_thread_modal.tpl -->
<!-- IF !config.usePagination -->
<noscript>
	<!-- IMPORT partials/paginator.tpl -->
</noscript>
<!-- ENDIF !config.usePagination -->
