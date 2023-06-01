module ApplicationHelper
  def default_meta_tags
    {
      site: 'Okogoto',
      title: 'あなたの小言、イメチェンしませんか？オコゴト画像作成サービス',
      reverse: true,
      charset: 'utf-8',
      description: 'Okogotoでは背景やフォントを使って雰囲気を変え、小言を客観的に見ることをお手伝いします！',
      canonical: 'https://okogoto.net',
      keywords: '小言,オコゴト,okogoto',
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: 'https://okogoto.net',
        image: image_url('Okogoto_ogp.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@cherry_00023'
      }
    }
  end
end
