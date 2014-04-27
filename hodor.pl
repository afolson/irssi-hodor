#!/usr/bin/perl
# irssi-hodor Hodor hodor hodor hodor hodor.
# Copyright (C) 2013  Amanda Folson <amanda@incredibl.org>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

# HODOR
use warnings;
use strict;
use Irssi;

my %IRSSI = (
	version		=> '0.1',
	author		=> 'Amanda Folson^W^WHodor',
	contact		=> 'amanda@incredibl.org',
	name		=> 'irssi-hodor',
	uri		=> 'https://github.com/afolson/irssi-hodor',
	description	=> 'Hodor hodor hodor hodor hodor hodor hodor hodor hodor hodor.',
	license		=> 'GPL',
);

# Hodor
sub hodor {
	my ($msg, $server, $witem) = @_;
	Irssi::signal_stop();
	Irssi::signal_remove('send text', 'hodor');
	Irssi::signal_emit('send text', rodoh("$msg"), $server, $witem);
	$witem->print("%B<<UNHODOR TEXT>>%n ". $msg, MSGLEVEL_CLIENTCRAP);
	Irssi::signal_add('send text', 'hodor');
}

# RODOH
sub rodoh {
	my ($inputline) = @_;
	my $hodor = "";
	while ($inputline =~ m/\G(\S+)(\s*)/g) {
		my ($word, $ws) = ($1, $2);
		$word = "hodor";
		$hodor .= $word . $ws;
	}
	return $hodor;
}

Irssi::signal_add('send text', 'hodor');
