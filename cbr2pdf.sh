#! /bin/sh -

export SUCCESS_STYLE=$'\e[1;32m'
export ERROR_STYLE=$'\e[1;31m'
export END_STYLE=$'\e[0m'
export BR=$'\n'

_is_valid_cbr_file()
{
  if [ "${1: -4}" == ".cbr" ]; then
      return 0
  else
      return 1
  fi
}


if ! _is_valid_cbr_file "$1"; then
    printf "${ERROR_STYLE}Error. The parsed file $0 is not a valid .cbr filefile!${END_STYLE}${BR}" 1>&2 && exit 1
fi

mkdir -p .cbr2pdf

ORIGINAL_CBR_FILE="$1"
ORIGINAL_BASENAME=$(basename "$ORIGINAL_CBR_FILE" .cbr)

ORIGINAL_CBR_FILE=$( echo "$ORIGINAL_CBR_FILE" | sed 's/ /\\ /g' )
ORIGINAL_BASENAME=$( echo "$ORIGINAL_BASENAME" | sed 's/ /\\ /g' )

eval cp "$ORIGINAL_CBR_FILE" ".cbr2pdf/"

COPIED_CBR_FILE=".cbr2pdf/$ORIGINAL_CBR_FILE"
COPIED_RAR_FILE=".cbr2pdf/$ORIGINAL_BASENAME.rar"
COPIED_PDF_FILE="$ORIGINAL_BASENAME.pdf"

eval mv "$COPIED_CBR_FILE" "$COPIED_RAR_FILE"

eval unrar e "$COPIED_RAR_FILE" ".cbr2pdf/" > /dev/null 2>&1

rm -f "$COPIED_PDF_FILE"
eval convert ".cbr2pdf/*.jpg" "$COPIED_PDF_FILE" > /dev/null 2>&1

rm -rf .cbr2pdf

printf "${SUCCESS_STYLE}The $ORIGINAL_CBR_FILE is converted to $COPIED_PDF_FILE!${END_STYLE}${BR}"
