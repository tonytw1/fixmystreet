package FixMyStreet::Cobrand::Bromley;
use base 'FixMyStreet::Cobrand::UKCouncils';

use strict;
use warnings;

sub council_id { return 2482; }
sub council_area { return 'Bromley'; }
sub council_name { return 'Bromley Council'; }
sub council_url { return 'bromley'; }

sub path_to_web_templates {
    my $self = shift;
    return [
        FixMyStreet->path_to( 'templates/web', $self->moniker )->stringify,
        FixMyStreet->path_to( 'templates/web/fixmystreet' )->stringify
    ];
}

sub disambiguate_location {
    my $self = shift;
    return {
        %{ $self->SUPER::disambiguate_location() },
        centre => '51.366836,0.040623',
        span   => '0.154963,0.24347',
        bounds => [ '51.289355,-0.081112', '51.444318,0.162358' ],
    };
}

sub example_places {
    return ( 'BR1 3UH', 'Glebe Rd, Bromley' );
}

sub process_extras {
    my $self     = shift;
    my $ctx      = shift;
    my $contacts = shift;
    my $extra    = shift;

    for my $field (qw/ fms_extra_title first_name last_name /) {
        my $value = $ctx->request->param($field);

        if ( !$value ) {
            $ctx->stash->{field_errors}->{$field} =
              _('This information is required');
        }
        push @$extra,
          {
            name        => $field,
            description => uc($field),
            value       => $value || '',
          };
    }

    if ( $ctx->request->param('fms_extra_title') ) {
        $ctx->stash->{fms_extra_title} =
          $ctx->request->param('fms_extra_title');
        $ctx->stash->{extra_name_info} = 1;
    }
}

1;

