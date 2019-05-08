require 'test_helper'

class ImageurlMailerTest < ActionMailer::TestCase
  test 'share' do
    @imageurl = Imageurl.create!(url: 'http://host.com/image.jpg', created_at: Time.current)
    share = ImageurlShare.new(
      to: 'user2@somedomain.com',
      from: 'user@otherdomain.com',
      message: 'Hi!', imageurl_id: @imageurl.id
    )
    email = ImageurlMailer.with(share.to_hash).shareimage_email

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['user@otherdomain.com'], email.from
    assert_equal ['user2@somedomain.com'], email.to
    assert_equal 'Somebody shared an image with you!', email.subject
    assert_equal read_fixture('shareimage').join, email.text_part.to_s
  end
end
