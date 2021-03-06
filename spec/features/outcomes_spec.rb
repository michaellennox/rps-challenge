feature 'Game Outcomes' do
  context 'while playing solo' do
    scenario 'when I lose, I should get told it' do
      allow_any_instance_of(Array).to receive(:sample).and_return(:paper)
      single_player_login
      choose 'rock'
      click_button 'Play!'
      expect(page).to have_content 'The victor is The Computer'
    end

    scenario 'when I win, I should get told it' do
      allow_any_instance_of(Array).to receive(:sample).and_return(:rock)
      single_player_login
      choose 'paper'
      click_button 'Play!'
      expect(page).to have_content 'The victor is Michael'
    end

    scenario 'when I draw, I should get told it' do
      allow_any_instance_of(Array).to receive(:sample).and_return(:scissors)
      single_player_login
      choose 'scissors'
      click_button 'Play!'
      expect(page).to have_content 'a draw'
    end
  end

  context 'while playing in a duo' do
    scenario 'when p2 wins, it should say so' do
      two_player_login
      choose 'rock'
      click_button 'Change Turns!'
      choose 'paper'
      click_button 'Play!'
      expect(page).to have_content 'The victor is Lach'
    end

    scenario 'when p1 wins, it should say so' do
      two_player_login
      choose 'paper'
      click_button 'Change Turns!'
      choose 'rock'
      click_button 'Play!'
      expect(page).to have_content 'The victor is Michael'
    end

    scenario 'when we draw, it should say so' do
      two_player_login
      choose 'scissors'
      click_button 'Change Turns!'
      choose 'scissors'
      click_button 'Play!'
      expect(page).to have_content 'a draw'
    end
  end
end
