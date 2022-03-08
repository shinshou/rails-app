module ApplicationHelper
  def header_link_item(name, path)
    class_name = 'nav-item'
    class_name << ' active' if current_page?(path) #現在のページとアクセス先のリンクが同一であれば'active'クラスを付与する。

    #content_tag = 任意のHTMLタグを作成する。
    content_tag :li, class: class_name do
      link_to name, path, class: 'nav-link'
    end
  end
end
