#require "mandrill_mailer"

class MandrillMailer < ActionMailer::Base
  default(
      from: "ashutosh.pandey@yogasmoga.com",
      reply_to: "ashutosh.pandey@yogasmoga.com"
  )

  def send_mail(email, subject, body)
    mail(to: email, subject: subject, body: body, content_type: "text/html")
  end

  def mandrill_template(template_name, attributes)
    mandrill = Mandrill::API.new("_juh2ayWNPqLPUJT05TKMA")

    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
    end

    mandrill.templates.render(template_name, [], merge_vars)["html"]
  end

  def welcome(user_id)

    user = User.find(user_id)
    subject = "Welcome to our awesome app!"
    merge_vars = {
        "NAME" => user.name
    }
#    body = mandrill_template("welcome", merge_vars)
    body = "Jai ho"

    send_mail(user.email, subject, body)
  end
end