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

public class Nil.Application : GLib.Application {
	private string[] filenames;

	private const OptionEntry[] option_entries = {
		{"compile", 'c', 0, OptionArg.NONE, null, "Compile but do not link", null},
		{"output", 'o', 0, OptionArg.FILENAME, null, "Output to file FILE", "FILE"},
		{OPTION_REMAINING, 0, 0, OptionArg.FILENAME_ARRAY, null, null, "FILE..."},
		{null},
	};

	internal Application() {
		Object(application_id: Config.APPLICATION_ID,
		       flags: ApplicationFlags.HANDLES_OPEN |
		       ApplicationFlags.HANDLES_COMMAND_LINE);
	}

	construct {
		add_main_option_entries(option_entries);
	}

	protected override int command_line(ApplicationCommandLine command_line) {
		var options = command_line.get_options_dict();
		var filenames_variant = options.lookup_value(OPTION_REMAINING,
		                                             VariantType.BYTESTRING_ARRAY);
		if (filenames_variant != null) {
			stdout.printf("not nothing\n");
			filenames = {};
		}
		return 0;
	}
}

