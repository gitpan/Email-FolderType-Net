use ExtUtils::MakeMaker;

WriteMakefile (
               AUTHOR        => 'Casey West <casey@geeknest.com>',
               ABSTRACT      => "Recognize folder types for network based message protocols.",
               NAME          => 'Email::FolderType::Net',
               PREREQ_PM     => {
                                 'Test::More'                  => '0.47',
                                 'URI'                         => '',
                                 'Email::FolderType::Register' => '',
                                },
               VERSION_FROM  => 'lib/Email/FolderType/Net.pm',
              );
