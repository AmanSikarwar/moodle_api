class EndPoints {
  static const String login = '/login/token.php';
  static const String logout = '/login/logout.php';

  static const String apiEndpoint = '/webservice/rest/server.php';
}

class ErrorMessages {
  static const String emptyUrl = 'Url is empty';
  static const String invalidEmail = 'Invalid email address';
  static const String invalidPassword =
      'password must be at least 6 characters';
  static const String invalidUrl = 'Invalid url';
  static const String invalidUsername =
      'username must be at least 3 characters';
  static const String invalidToken = 'Invalid token';
  static const String urlHostMissing = 'Url host missing';
}

class HttpStatus {
  static const int ok = 200;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;
}

class WSFunctions {
  const WSFunctions();

  static const String coreWebGetSiteInfo =
      'core_webservice_get_site_info';
  static const String coreAuthLogin = 'core_auth_login';
  static const String coreAuthConfirmUser = 'core_auth_confirm_user';
  static const String coreAuthConfirmUserSignup =
      'core_auth_confirm_user_signup';
  static const String coreAuthEmailSignup = 'core_auth_email_signup';
  static const String coreAuthRequestPasswordReset =
      'core_auth_request_password_reset';
  static const String coreCourseGetCourses = 'core_course_get_courses';
  static const String coreCourseGetContents =
      'core_course_get_contents';
  static const String
      coreCourseGetEnrolledCoursesByTimelineClassification =
      'core_course_get_enrolled_courses_by_timeline_classification';
  static const String coreCourseGetUserAdministrationOptions =
      'core_course_get_user_administration_options';
  static const String coreCourseSearchCourses =
      'core_course_search_courses';
  static const String coreCourseViewCourse = 'core_course_view_course';
  static const String coreEnrolGetUsersCourses =
      'core_enrol_get_users_courses';
  static const String coreFileGetFiles = 'core_file_get_files';
  static const String coreFileGetPrivateFiles =
      'core_file_get_private_files';
  static const String coreFileGetPublicFiles =
      'core_file_get_public_files';
  static const String coreFileUpload = 'core_file_upload';
  static const String coreGradesGetGrades = 'core_grades_get_grades';
  static const String coreMessageGetContacts =
      'core_message_get_contacts';
  static const String coreMessageGetMessages =
      'core_message_get_messages';
  static const String coreMessageGetRecentContacts =
      'core_message_get_recent_contacts';
  static const String coreMessageGetUnreadConversationCount =
      'core_message_get_unread_conversation_count';
  static const String coreMessageMarkConversationRead =
      'core_message_mark_conversation_read';
  static const String coreMessageSearchContacts =
      'core_message_search_contacts';
  static const String coreMessageSearchMessages =
      'core_message_search_messages';
  static const String coreMessageSendInstantMessages =
      'core_message_send_instant_messages';
  static const String coreMessageViewMessage =
      'core_message_view_message';
  static const String coreNotesCreateNotes = 'core_notes_create_notes';
  static const String coreNotesDeleteNotes = 'core_notes_delete_notes';
  static const String coreNotesGetNotes = 'core_notes_get_notes';
  static const String coreNotesUpdateNotes = 'core_notes_update_notes';
  static const String coreNotesViewNotes = 'core_notes_view_notes';
  static const String coreTagGetTags = 'core_tag_get_tags';
  static const String coreTagGetTagCollections =
      'core_tag_get_tag_collections';
  static const String coreTagGetTagIndex = 'core_tag_get_tag_index';
  static const String coreTagSearchTags = 'core_tag_search_tags';
  static const String coreUserAddUserDevice =
      'core_user_add_user_device';
  static const String coreUserAddUserPrivateFiles =
      'core_user_add_user_private_files';
}

const String moodleApiVersion = '0.0.1';
const String moodleApiVersionName = 'alpha';

const String defaultService = 'moodle_mobile_app';
