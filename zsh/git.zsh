# Open the current git project or Gist at GitHub
# https://gist.github.com/1856938
function open_at_github() {
  GIT='git'
  FETCH_URL=`$GIT remote show origin -n  | sed -n '/Fetch URL/p' | awk '{print $3}' | sed -E 's/[:@]/ /g' `
  GH_HOST=`echo $FETCH_URL | awk '{print $2}' `
  REPOS=`echo $FETCH_URL | awk '{print $3}' | sed 's/.git$//'`
  ORIGIN="http://$GH_HOST/"
  BRANCH=`$GIT branch | grep -F '*' | sed 's/^* //'`

  echo $REPOS | 'egrep' -q '^gist/'
  if [ $? = 0 ]; then
      GIST=YES
  else
      GIST=NO
  fi

  if test "x$1" = "x"  ; then
      if test $GIST = "YES" ; then
          URL="$ORIGIN$REPOS"
      else
          if test "x$BRANCH" = "x(no branch)"; then
              URL="$ORIGIN$REPOS"
          else
              URL="$ORIGIN$REPOS/tree/$BRANCH"
          fi
      fi
  else
      if test $GIST = "YES" ; then
          URL="$ORIGIN$REPOS/$1"
      else
          URL="$ORIGIN$REPOS/commit/$1"
      fi
  fi
  echo $URL
  open "$URL"
}