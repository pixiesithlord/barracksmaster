class Playlist
  def self.all
    list_ids = ['PLNTLXH5Oi1vZKTThv6BRUxFp2o59bUGrX','PLNTLXH5Oi1vbeO4EieKGQPHjD8uor46Bo']

    list_ids.map do |id|
      playlist = Yt::Playlist.new url: "youtube.com/playlist?list=#{id}"
      playlist.playlist_items.map do |item|
        h = {}
        h['title']    = item.title
        h['thumbnail'] = item.thumbnail_url(size = 'high')
        h['url']     = "https://www.youtube.com/watch?v=#{item.video_id}"
        h
      end
    end
    
  end
end