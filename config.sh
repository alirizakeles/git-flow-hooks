# pre-commit
#pre_commit_modules="jshint.sh phplint.sh prevent-master-commit.sh prevent-merge-marker-commits.sh"
pre_commit_modules="prevent-master-commit.sh prevent-merge-marker-commits.sh"
post_flow_feature_finish_modules="post-slack.sh"
post_flow_hotfix_finish_modules="post-slack.sh"
post_flow_release_finish_modules="post-slack.sh"
