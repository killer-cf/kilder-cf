require 'rails_helper'

describe 'User visit homepage' do
  it 'from URL' do
    create :download
    Download.last.curriculum.attach(io: File.open(Rails.root.join('app/assets/images/cv.pdf')), filename: 'cv.pdf',
                                    content_type: 'application/pdf')
    visit root_path

    expect(page).to have_content 'Desenvolvedor Web Full-Stack'
    expect(Download.last.curriculum).to be_present
  end
end