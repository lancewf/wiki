pkg_name=wiki
pkg_origin=lancewf
pkg_version="0.1.0"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=("Apache-2.0")
pkg_source=""

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(core/nginx core/mysql-client)

pkg_exports=(
   [port]=http.listen.port
   [local_only]=http.listen.local_only
)

pkg_binds=(
  [database]="port username password local_only"
  [php]="port local_only"
)

pkg_binds_optional=(
  [proxy]="wiki_domain_name"
)

do_build(){
  return 0
}

do_install() {
  mkdir $pkg_prefix/static
  cp -r src/* $pkg_prefix/static/.
  
  mkdir $pkg_prefix/database
  cp habitat/database/* $pkg_prefix/database/.

  return 0
}
