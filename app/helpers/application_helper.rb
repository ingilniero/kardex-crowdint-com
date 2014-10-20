module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
      when :notice
        "alert-success"   # Green
      when :error
        "alert-danger"    # Red
      when :alert
        "alert-warning"   # Yellow
      when :success
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end

  def show_badges
    if @badges.empty?
      render 'shared/default_badge_message'
    else
      render partial: 'shared/badge', collection: @badges
    end
  end

  def show_public_workshops(active)
    if active
      show_active_published_workshops
    else
      show_published_workshops
    end
  end

  def show_active_published_workshops
    if @workshops.active.published
      render partial: 'workshops_list', locals:
        { workshops: @workshops.published.active }
    else
      render 'shared/default_workshop_message'
    end
  end

  def show_published_workshops
    if @workshops.published
      render partial: 'workshops_list', locals:
        { workshops: @workshops.published }
    else
      render 'shared/default_workshop_message'
    end
  end

  def show_last_active_published_workshop
    if WorkshopsEngine::Workshop.active.published.last
      render partial: 'shared/workshop', locals: { workshop:
        WorkshopsEngine::Workshop.active.published.last }
    else
      render 'shared/default_workshop_message'
    end
  end

  def show_workshop_month
    if WorkshopsEngine::Workshop.all.active.published.last
      if WorkshopsEngine::Workshop.all.active.published.last.date_and_time
        WorkshopsEngine::Workshop.all.active.published.
          last.date_and_time.strftime("%B")
      end
    end
  end

  def show_show_dont_tell(active)
    if active
      show_active_show_dont_tells
    else
      show_all_show_dont_tells
    end
  end

  def show_all_show_dont_tells
    if @show_dont_tells.empty?
      render 'shared/default_show_dont_tell_message'
    else
      render partial: 'show_dont_tells_list', locals: { show_dont_tells:
        @show_dont_tells }
    end
  end

  def show_active_show_dont_tells
    if @show_dont_tells.active.empty?
      render 'shared/default_show_dont_tell_message'
    else
      render partial: 'show_dont_tells_list', locals: { show_dont_tells:
        @show_dont_tells.active }
    end
  end

  def show_last_active_show_dont_tell
    if ShowDontTellsEngine::ShowDontTell.active.last
      render partial: 'shared/show_dont_tell', locals: { show_dont_tell:
        ShowDontTellsEngine::ShowDontTell.active.last }
    else
      render 'shared/default_show_dont_tell_message'
    end
  end

  def show_presentation(presentation)
    render partial: 'presentations/presentation',
      locals: { presentation: presentation }
  end

  def define_badge_column
    if params[:controller] == 'users' && params[:action] == 'show'
      'badge-5-col'
    else
      'badge-6-col'
    end
  end

  def unknown_image?(badge)
    'badge-unknown' unless current_user.badges.include?(badge)
  end

  def badge_earn_icon(badge)
    if params[:controller] == 'badges' and badge.users.include? current_user
      content_tag :div, nil, class: 'badge-earned-icon'
    end
  end
end
