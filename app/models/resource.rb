class Resource < ActiveRecord::Base
  belongs_to :user

  has_attached_file :asset,
                    :path => ":class/:id/:style.:extension"

  validates_attachment_size :asset, :less_than => 100.megabytes
  validates_attachment_content_type :asset, :content_type =>
    ["audio/mpeg", "audio/x-m4a", "audio/x-mpegurl", "audio/x-pn-realaudio", "audio/x-wav",
      "video/mpeg", "video/mpeg", "video/quicktime", "video/x-msvideo", "video/x-ms-asf", "video/x-sgi-movie",
      "text/plain", "text/css", "text/x-vcard",
      "application/msword", "application/pdf", "application/vnd.ms-excel", "application/vnd.ms-powerpoint"]

  TYPO = ['音乐', '视频', '其他文件']
end
