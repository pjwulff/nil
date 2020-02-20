/* Copyright 2020 Peter Wulff
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private static bool version;
private static bool compile;
private static bool ccode;
private static string output_filename;
private static string[] input_filenames;

private const OptionEntry[] option_entries = {
	{"version", 0, 0, OptionArg.NONE, ref version, "Display version information", null},
	{"compile", 'c', 0, OptionArg.NONE, ref compile, "Compile but do not link", null},
	{"ccode", 'C', 0, OptionArg.NONE, ref ccode, "Output C Code", null},
	{"output", 'o', 0, OptionArg.FILENAME, ref output_filename, "Output to file FILE", "FILE"},
	{OPTION_REMAINING, 0, 0, OptionArg.FILENAME_ARRAY, ref input_filenames, null, "FILE..."},
	{null},
};

int main (string[] args)
{
	try {
		var opt_context = new OptionContext();
		opt_context.set_help_enabled(true);
		opt_context.add_main_entries(option_entries, null);
		opt_context.parse(ref args);
	} catch (OptionError e) {
		printerr("%s\n", e.message);
	}
	if (version) {
		stdout.printf("%s %s\n", Config.PACKAGE_NAME, Config.PACKAGE_VERSION);
		return 0;
	}
	return 0;
}
