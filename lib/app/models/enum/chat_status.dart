enum ChatStatus{
  casual,
  underProcess,
  ordered
}

ChatStatus getCourseStatusFromString(String course) {
  switch (course) {
    case 'CASUAL':
      return ChatStatus.casual;

    case 'UNDER_PROCESS':
      return ChatStatus.underProcess;

    case 'ORDERED':
      return ChatStatus.ordered;

    default:
      return ChatStatus.casual;
  }
}

String chatStatusToString(ChatStatus? course) {
  switch (course) {
    case ChatStatus.casual:
      return 'CASUAL';

    case ChatStatus.underProcess:
      return 'UNDER_PROCESS';

    case ChatStatus.ordered:
      return 'ORDERED';

    default:
      return 'CASUAL';
  }
}
