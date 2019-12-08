defmodule StatsWeb.Validators do  
    @email_regexp ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/
    @url_regexp ~r/^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/
    @topic_regexp ~r/[a-z]/

    def is_email(email) do
      case Regex.match?(@email_regexp, email) do
        false -> :error
        true -> {:ok, email}
      end
    end

    def is_url(url) do
      case Regex.match?(@url_regexp, url) do
        false -> :error
        true -> {:ok, url}
      end
    end

    def is_topic(topic) do
      case Regex.match?(@topic_regexp, topic) do
        false -> :error
        true -> {:ok, topic}
      end
    end
end
  