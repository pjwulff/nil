[CCode (
	cprefix = "",
	lower_case_cprefix = "",
	cheader_filename = "config.h")]
namespace Config {
	const int MAJOR_VERSION;
	const int MINOR_VERSION;
	const int PATCH_VERSION;
	const string PACKAGE_NAME;
	const string PACKAGE_VERSION;
	const string PACKAGE_STRING;
	const string APPLICATION_ID;
}
