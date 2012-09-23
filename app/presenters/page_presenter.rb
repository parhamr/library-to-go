# encoding: utf-8

module PagePresenter

  def time_label
    [:visible_at, :hidden_at].
      map do |atr|
        "#{atr.to_s.humanize.titleize}: #{(self.send(atr).present? ? self.send(atr).strftime('%D') : 'none')}"
      end.
      compact.
      join(' and ')
  end

end
