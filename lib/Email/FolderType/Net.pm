package Email::FolderType::Net;
# $Id: Net.pm,v 1.2 2004/08/14 16:52:19 cwest Exp $
use strict;

use vars qw[$VERSION];
$VERSION = sprintf "%d.%02d", split m/\./, (qw$Revision: 1.2 $)[1];

use Email::FolderType::Register qw[register_type];
use URI;

=head1 NAME

Email::FolderType::Net - Recognize folder types for network based message protocols.

=head1 SYNOPSIS

  use Email::FolderType qw[folder_type];

  my $type = folder_type($folder) || 'unknown';
  print "$folder is type $type.\n";

=head2 DESCRIPTION

Registers several mail folder types that are known as network based
messaging protocols. Folder names for these protocols should be
specified using a L<URI|URI> syntax.

=head2 IMAP

  print 'IMAP' if folder_type('imap://foo.com/folder') eq 'IMAP';

Returns this folder type if the scheme is C<imap>.

=head2 IMAPS

  print 'IMAPS' if folder_type('imaps://example.com') eq 'IMAPS';

Returns this folder type if the scheme is C<imaps>.

=head2 POP3

  print 'POP3' if folder_type('pop3://example.com:110') eq 'POP3';

Returns this folder type if the schem is C<pop> or C<pop3>.

=head2 POP3S

  print 'POP3S' if folder_type('pops://foo.com') eq 'POP3S';

returns this folder type if the scheme is C<pops> or C<pop3s>.

=cut

register_type IMAP  => sub { _from_scheme(imap  => shift) };
register_type IMAPS => sub { _from_scheme(imaps => shift) };
register_type POP3  => sub { _from_scheme('pop' => shift) };
register_type POP3  => sub { _from_scheme(pop3  => shift) };
register_type POP3S => sub { _from_scheme(pops  => shift) };
register_type POP3S => sub { _from_scheme(pop3s => shift) };

sub _from_scheme {
    my $scheme = shift;
    my $uri    = URI->new(shift);
    return 1 if lc($uri->scheme) eq $scheme;
    return;
}

__END__

=head1 SEE ALSO

L<Email::FolderType>,
L<Email::FolderType::Local>,
L<URI>.

=head1 AUTHOR

Casey West <F<casey@geeknest.com>>.

=head1 COPYRIGHT

  Copyright (c) 2004 Casey West.  All rights reserved.
  This module is free software; you can redistribute it and/or modify it
  under the same terms as Perl itself.

=cut
