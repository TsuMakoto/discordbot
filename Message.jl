module Message
const DEFAULT = "メンションつけて、```julia の形式でコードブロックを作ってみて！！"
const REPLY = "標準出力をとってます！"
const REGEX = r"(?s)(?<=`{3}julia)(.+)(?=`{3})"
end
