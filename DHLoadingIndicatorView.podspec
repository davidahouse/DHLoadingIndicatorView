#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "DHLoadingIndicatorView"
  s.version          = File.read('VERSION')
  s.summary          = "A view that displays an activity indicator and optional text label"
  s.description      = <<-DESC
                       DHLoadingIndicatorView is a view to use when you are loading content in the
                       background and want to let the user know that something is happening. The view
                       contains an animated activity indicator along with an optional text label.

                       There are many customizable features of the view to fit your UI.
                       DESC
  s.homepage         = "https://www.github.com/davidahouse/DHLoadingIndicatorView"
  s.license          = 'MIT'
  s.author           = { "David House" => "davidahouse@gmail.com" }
  s.source           = { :git => "https://www.github.com/davidahouse/DHLoadingIndicatorView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/davidahouse'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets/*.png'
end
