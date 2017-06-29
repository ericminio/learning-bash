function extractSection() {
  token=$1
  before=$2
  after=$3
  input=$4
  line=`grep -n $token $input | cut -f1 -d':' | head -1`
  cat -n $input | head -n $((line+after)) | tail -n $((before+after+1))
}
