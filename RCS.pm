
	package VERSION::RCS; use VERSION::RCS qw($Id: RCS.pm,v 1.3 2002/04/09 09:07:34 root Exp $);
	
	$VERSION=$VERSION||0.01;

#
# 2002 (c) Daniel.Peder@infoset.cz, all terms same as PERL distribution and other copyrigth terms included in this package
#	

sub import
{
	my( %VersionProperty );
	# important fields:  [----]                          [----]
	@VersionProperty{qw( format garbage1 rcsCopyFilename number date time owner status lock garbage2 )} = @_;
	${scalar(caller( )).'::VERSION'} = $VersionProperty{'number'};
}

1;

#
# INTRODUCTION:
#	Unified, simplified and nice solution for embedding of 
#	version-control-code-string into your code sources.
#	This is proposed just as GLUE to any
#	version-control-software of Your choice.
#
#
# MAIN ADVANTAGE:
#	no more hand typing of code line like this:
#		$VERSION = 1.01
#
#
# SYNOPSIS:
#	package MyTestPackage; use VERSION::RCS qw($Id: RCS.pm,v 1.3 2002/04/09 09:07:34 root Exp $);
#	use warnings;
#	$VERSION=$VERSION||0.01;
#	print "Version of MyTestPackage is:", $VERSION, "\n";
#
#
# PROPOSAL:
#	( to all version-control-software developers )
#	help me to create modules compatible with your version control software.
#	Three single steps You should do:
#
#	-1- 
#	create properly named new module.
#	example: your version control softvare name is "VCSX", then you should create
#	module named VCSX.pm containing import() subroutine as described in following step...
#
#	-2-
#	edit the above sub import { ... } to be accepting the version control string
#	in your "VCSX" format. The string is passed via import() mechanism as
#	described in SYNOPSIS.
#
#	-3-
#	send me the module and I will do the rest. My e-mail is: Daniel.Peder@infoset.cz
#
#
# DETAILS:
# 	important fields ( of hash variable %VersionProperty ):
#
#	- format - 
#	is the name of this package (in our example VERSION::RCS), passed by 
#	import() mechanism. It is in fact format-style of used version string.
#
#	- number -
#	is the version number. It will be exported-and-assigned to
#	$VERSION variable in the proper namespace of calling package.
#
# 	other fields ( of hash variable %VersionProperty ):
#	
#	Intended just for possible future use.
#	Might be anything like garbage1, garbage2, garbage3, etc...
#	but it seems to be more meaningfull to give it some descriptive names
#
#
# BUGS:
#	-1-
#	there is perl warning about qw{} possible attempt to separate word by commas
#	because of RCS's naming behavior like this example: myPackage.pm,v 
#
#	There are two ways (that I'am sure about) to eliminate this warning:
#
#	1st) change RCS's naming behavior by setting RCSINIT environment variable to something like that:
#		RCSINIT=-x_rev/,v
#
#	2nd) rather than using '-x' general switch, use the 'use warnings' line after the 'use VERSION::RCS' line
#		as described in the SYNOPSIS
#
#	-2-
#	Somebody could say that we are working with revision number instead of version number. Yes we are.
#
#
