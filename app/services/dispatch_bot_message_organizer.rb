class DispatchBotMessageOrganizer
  include Interactor::Organizer

  organize FetchUserService, ProcessBotMessageService
end
