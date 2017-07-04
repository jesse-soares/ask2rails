xml.instruct!

xml.rss version: "2.0" do
  xml.channel do
    xml.title @question.title
    xml.link question_url(@question)
    xml.description simple_format(@question.description)
    xml.pubDate @question.created_at.xmlschema

    @answers.each do |answer|
      xml.item do
        xml.title t("answer.feed_item_title", name: answer.user.name)
        xml.description simple_format(answer.content)
        xml.link question_url(@question, anchor: dom_id(answer))
        xml.guid answer.id
        xml.pubDate answer.created_at.xmlschema
      end
    end
  end
end