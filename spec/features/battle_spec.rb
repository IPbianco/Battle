
  feature 'fill names and submitting the form' do
    scenario "player1 name appears" do
      sign_in_and_play
      expect(page).to have_content "Antonio vs. Ignacio"
    end
  end

  feature "seeing opponent's hit points" do
    scenario "visiting play page and seeing 60HP" do
      sign_in_and_play
      expect(page).to have_content "HP: 60/60"
    end
  end

  feature "attacking" do
    before(:each) do
      sign_in_and_play
      allow(Player).to receive(:show_damage).and_return(10)
      click_button "Attack"
    end
    scenario "attacking player 2 and receive confirmation" do
      expect(page).to have_content "Antonio attacked Ignacio."
    end

    scenario "when attacking first_time, reduce player 2 HP by 10" do
      expect(page).to have_content "P2 HP: 50/60"
    end

    scenario "when attacking second_time, reduce player 1 HP by 10" do
      click_button "Attack"
      expect(page).to have_content "P1 HP: 50/60"
    end

    scenario "when attacking a third time, reduce player 2 HP by 20" do
      2.times do
        click_button "Attack"
      end
      expect(page).to have_content "P2 HP: 40/60"
    end

    scenario "when player 2 reaches 0 HP, you receive a lost confirmation" do
      10.times do
        click_button "Attack"
      end
      expect(page).to have_content "Ignacio lost!"
    end

  end
