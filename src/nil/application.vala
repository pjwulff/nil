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
	private string? filename;
	private bool interactive = true;

	private const OptionEntry[] option_entries = {
		{OPTION_REMAINING, '\0', 0, OptionArg.STRING_ARRAY, null, null},
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
		                                             VariantType.STRING_ARRAY);
		if (filenames_variant != null) {
			var filenames = filenames_variant.get_strv();
			filename = filenames[0];
			interactive = false;
		}
		return 0;
	}
}

