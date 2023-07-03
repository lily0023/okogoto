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

  def back_before_page
    if request.referer&.include?('/edit') || request.referer&.include?('/new')
      link_to t('defaults.back_before_page'), posts_path
    elsif request.referer&.include?('/posts')
      link_to :back do
        t('defaults.back_before_page')
      end
    elsif request.referer&.include?('/profile')
      link_to :back do
        t('defaults.back_before_mypage')
      end
    else
      link_to t('defaults.back_before_page'), posts_path
    end
  end
end
