<!-- IMPORT partials/breadcrumbs.tpl -->
<div class="account settings">
	<!-- IMPORT partials/account/header.tpl -->
	<div class="row">
		<div class="col-xs-12">

			<!-- IF allowUserHomePage -->
			<div class="card">
	            <div class="card-header">
	            	[[user:select-homepage]]
	            </div>
	            <div class="card-body card-padding">
	            	<div class="form-group fg-line">
		            	<div class="select">
			            	<label for="dailyDigestFreq">[[user:homepage]]</label>
							<select class="form-control" id="homePageRoute" data-property="homePageRoute">
								<option value="none">None</option>
								<!-- BEGIN homePageRoutes -->
								<option value="{homePageRoutes.route}" <!-- IF homePageRoutes.selected -->selected="1"<!-- ENDIF homePageRoutes.selected -->>{homePageRoutes.name}</option>
								<!-- END homePageRoutes -->
							</select>
						</div>
					</div>
					<small>[[user:homepage_description]]</small>
					
					<div id="homePageCustom" class="form-group" style="display: none;">
						<div class="fg-line">
							<label for="homePageCustom">[[user:custom_route]]</label>
							<input type="text" class="form-control" data-property="homePageCustom" id="homePageCustom" value="{settings.homePageRoute}" />
						</div>
						<small>[[user:custom_route_help]]</small>
					</div>
	            </div>
	        </div>
			<!-- ENDIF allowUserHomePage -->

			<div class="card">
	            <div class="card-header">
	            	[[user:browsing]]
	            </div>
	            <div class="card-body card-padding">
	            	<div class="checkbox">
	                    <label>
	                        <input type="checkbox" data-property="openOutgoingLinksInNewTab" <!-- IF settings.openOutgoingLinksInNewTab -->checked<!-- ENDIF settings.openOutgoingLinksInNewTab -->>
	                        <i class="input-helper"></i>
	                        [[user:open_links_in_new_tab]]
	                    </label>
	                </div>
	                <!-- IF inTopicSearchAvailable -->
	                <div class="checkbox">
	                    <label>
	                        <input type="checkbox" data-property="topicSearchEnabled" <!-- IF settings.topicSearchEnabled -->checked<!-- ENDIF settings.topicSearchEnabled -->>
	                        <i class="input-helper"></i>
	                        [[user:enable_topic_searching]]
	                    </label>
	                </div>
	                <small class="help-block">[[user:topic_search_help]]</small>
	                <!-- ENDIF inTopicSearchAvailable -->
	                <div class="checkbox">
	                	<label>
	                        <input type="checkbox" data-property="scrollToMyPost" <!-- IF settings.scrollToMyPost -->checked<!-- ENDIF settings.scrollToMyPost -->>
	                        <i class="input-helper"></i>
	                        [[user:scroll_to_my_post]]
	                    </label>
	                </div>
	                <div class="checkbox">
	                    <label>
	                        <input type="checkbox" data-property="delayImageLoading" <!-- IF settings.delayImageLoading -->checked<!-- ENDIF settings.delayImageLoading -->>
	                        <i class="input-helper"></i>
	                        [[user:delay_image_loading]]
	                    </label>
	                </div>
	                <small class="help-block">[[user:image_load_delay_help]]</small>
	            </div>
	        </div>

	        <div class="card">
	            <div class="card-header">
	            	[[global:privacy]]
	            </div>
	            <div class="card-body card-padding">
	            	<div class="checkbox">
	                    <label>
	                        <input type="checkbox" data-property="showemail" <!-- IF settings.showemail -->checked <!-- ENDIF settings.showemail -->>
	                        <i class="input-helper"></i>
	                        [[user:show_email]]
	                    </label>
	                </div>
	                <div class="checkbox">
	                    <label>
	                        <input type="checkbox" data-property="showfullname" <!-- IF settings.showfullname -->checked<!-- ENDIF settings.showfullname -->>
	                        <i class="input-helper"></i>
	                        [[user:show_fullname]]
	                    </label>
	                </div>
	                <div class="checkbox">
	                    <label>
	                        <input type="checkbox" data-property="restrictChat" <!-- IF settings.restrictChat -->checked<!-- ENDIF settings.restrictChat -->>
	                        <i class="input-helper"></i>
	                        [[user:restrict_chats]]
	                    </label>
	                </div>
	            </div>
	        </div>

	        <!-- IF !disableEmailSubscriptions -->
			<div class="card">
	            <div class="card-header">
	            	[[global:email]]
	            </div>
	            <div class="card-body card-padding">
	            	<div class="form-group fg-line">
		            	<div class="select">
			            	<label for="dailyDigestFreq">[[user:digest_label]]</label>
							<select class="form-control" id="dailyDigestFreq" data-property="dailyDigestFreq">
								<!-- BEGIN dailyDigestFreqOptions -->
								<option value="{dailyDigestFreqOptions.value}" <!-- IF dailyDigestFreqOptions.selected -->selected<!-- ENDIF dailyDigestFreqOptions.selected -->>{dailyDigestFreqOptions.name}</option>
								<!-- END dailyDigestFreqOptions -->
							</select>
						</div>
					</div>
					<small>[[user:digest_description]]</small>
	            	<div class="checkbox">
	                    <label>
	                        <input type="checkbox" data-property="sendChatNotifications" <!-- IF settings.sendChatNotifications -->checked<!-- ENDIF settings.sendChatNotifications -->>
	                        <i class="input-helper"></i>
	                        [[user:send_chat_notifications]]
	                    </label>
	                </div>
	                <div class="checkbox">
	                    <label>
	                        <input type="checkbox" data-property="sendPostNotifications" <!-- IF settings.sendPostNotifications -->checked<!-- ENDIF settings.sendPostNotifications -->>
	                        <i class="input-helper"></i>
	                        [[user:send_post_notifications]]
	                    </label>
	                </div>
	            </div>
	        </div>
	        <!-- ENDIF !disableEmailSubscriptions -->

	        <div class="card">
	            <div class="card-header">
	            	[[topic:watch]]
	            </div>
	            <div class="card-body card-padding">
	            	<div class="checkbox">
	                    <label>
	                        <input type="checkbox" data-property="followTopicsOnCreate" <!-- IF settings.followTopicsOnCreate -->checked <!-- ENDIF settings.followTopicsOnCreate -->>
	                        <i class="input-helper"></i>
	                        [[user:follow_topics_you_create]]
	                    </label>
	                </div>
	                <div class="checkbox">
	                    <label>
	                        <input type="checkbox" data-property="followTopicsOnReply" <!-- IF settings.followTopicsOnReply -->checked<!-- ENDIF settings.followTopicsOnReply -->>
	                        <i class="input-helper"></i>
	                        [[user:follow_topics_you_reply_to]]
	                    </label>
	                </div>
	            </div>
	        </div>

	        <div class="card">
	            <div class="card-header">
	            	[[global:pagination]]
	            </div>
	            <div class="card-body card-padding">
	            	<div class="checkbox">
	                    <label>
	                        <input type="checkbox" data-property="usePagination" <!-- IF settings.usePagination -->checked<!-- ENDIF settings.usePagination -->>
	                        <i class="input-helper"></i>
	                        [[user:paginate_description]]
	                    </label>
	                </div>

					<div class="form-group">
                        <div class="fg-line">
                        	<label>[[user:topics_per_page]]</label>
                            <input type="text" class="form-control" data-property="topicsPerPage" value="{settings.topicsPerPage}">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="fg-line">
                        	<label>[[user:posts_per_page]]</label>
                            <input type="text" class="form-control" data-property="postsPerPage" value="{settings.postsPerPage}">
                        </div>
                    </div>
	                
	            </div>
	        </div>

	        <div class="card">
	            <div class="card-header">
	            	[[user:notifications_and_sounds]]
	            </div>
	            <div class="card-body card-padding">
	            	<div class="row">
	            		<div class="col-xs-10">
			            	<div class="form-group fg-line">
				            	<div class="select">
				            		<label for="notification">[[user:notification-sound]]</label>
									<select class="form-control" id="notification" name="notification" data-property="notificationSound">
										<option value="">[[user:no-sound]]</option>
										<!-- BEGIN notificationSound -->
										<option value="{notificationSound.name}" <!-- IF notificationSound.selected -->selected<!-- ENDIF notificationSound.selected -->>{notificationSound.name}</option>
										<!-- END notificationSound -->
									</select>
								</div>
							</div>
						</div>
						<div class="col-xs-2">
							<button type="button" class="btn btn-sm btn-primary" data-action="play"><span class="hidden-xs">[[global:play]] </span><i class="fa fa-play"></i></button>
						</div>
					</div>
					
					<div class="row">
	            		<div class="col-xs-10">
			            	<div class="form-group fg-line">
				            	<div class="select">
				            		<label for="chat-incoming">[[user:incoming-message-sound]]</label>
									<select class="form-control" id="chat-incoming" name="chat-incoming" data-property="incomingChatSound">
										<option value="">[[user:no-sound]]</option>
										<!-- BEGIN incomingChatSound -->
										<option value="{incomingChatSound.name}" <!-- IF incomingChatSound.selected -->selected<!-- ENDIF incomingChatSound.selected -->>{incomingChatSound.name}</option>
										<!-- END incomingChatSound -->
									</select>
								</div>
							</div>
						</div>
						<div class="col-xs-2">
							<button type="button" class="btn btn-sm btn-primary" data-action="play"><span class="hidden-xs">[[global:play]] </span><i class="fa fa-play"></i></button>
						</div>
					</div>
					
					<div class="row">
	            		<div class="col-xs-10">
			            	<div class="form-group fg-line">
				            	<div class="select">
				            		<label for="chat-outgoing">[[user:outgoing-message-sound]]</label>
									<select class="form-control" id="chat-outgoing" name="chat-outgoing" data-property="outgoingChatSound">
										<option value="">[[user:no-sound]]</option>
										<!-- BEGIN outgoingChatSound -->
										<option value="{outgoingChatSound.name}" <!-- IF outgoingChatSound.selected -->selected<!-- ENDIF outgoingChatSound.selected -->>{outgoingChatSound.name}</option>
										<!-- END outgoingChatSound -->
									</select>
								</div>
							</div>
						</div>
						<div class="col-xs-2">
							<button type="button" class="btn btn-sm btn-primary" data-action="play"><span class="hidden-xs">[[global:play]] </span><i class="fa fa-play"></i></button>
						</div>
					</div>
	            </div>
	        </div>

			<div class="card">
	            <div class="card-header">
	            	[[global:language]]
	            </div>
	            <div class="card-body card-padding">
	            	<div class="form-group fg-line">
		            	<div class="select">
							<select data-property="userLang" class="form-control">
								<!-- BEGIN languages -->
								<option value="{languages.code}" <!-- IF languages.selected -->selected<!-- ENDIF languages.selected -->>{languages.name} ({languages.code})</option>
								<!-- END languages -->
							</select>
						</div>
					</div>
	            </div>
	        </div>

		</div>
		<div class="col-xs-12">
			<button id="submitBtn" class="btn btn-primary btn-lg">[[global:save_changes]]</button>
		</div>
	</div>
</div>