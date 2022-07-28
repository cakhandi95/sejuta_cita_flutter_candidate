library m_core;

// TODO HANDY : src/data/datasources/models
export 'src/data/datasources/search_repo_remote_datasource.dart';
export 'src/data/datasources/search_issues_remote_datasource.dart';
export 'src/data/datasources/search_users_remote_datasource.dart';

// TODO HANDY : src/data/models
export 'src/data/models/search_repositories/search_repo_model.dart';
export 'src/data/models/search_repositories/search_repo_response.dart';
export 'src/data/models/search_issues/search_issues_model.dart';
export 'src/data/models/search_issues/search_issues_response.dart';
export 'src/data/models/search_users/search_users_model.dart';
export 'src/data/models/search_users/search_users_response.dart';

// TODO HANDY : src/data/repositories
export 'src/data/repositories/search_users_repository_impl.dart';
export 'src/data/repositories/search_issues_repository_impl.dart';
export 'src/data/repositories/search_repo_repository_impl.dart';

// TODO HANDY : src/domain/repositories
export 'src/domain/repositories/search_users_repository.dart';
export 'src/domain/repositories/search_issues_repository.dart';
export 'src/domain/repositories/search_repo_repository.dart';

export 'src/presentation/cubit/search_issues_state.dart';
export 'src/presentation/cubit/search_issues_cubit.dart';
export 'src/presentation/cubit/search_users_cubit.dart';
export 'src/presentation/cubit/search_users_state.dart';
export 'src/presentation/cubit/search_repo_cubit.dart';
export 'src/presentation/cubit/search_repo_state.dart';

export 'src/presentation/widgets/v_popup.dart';
export 'src/presentation/widgets/v_widget.dart';
export 'src/presentation/widgets/empty_data_widget.dart';
export 'src/presentation/widgets/error_network_widget.dart';

export 'src/presentation/widgets/popup/custom_dialog_box.dart';
export 'src/presentation/widgets/popup/loading_popup.dart';

export 'src/domain/usecases/get_search_issues.dart';
export 'src/domain/usecases/get_search_repo.dart';
export 'src/domain/usecases/get_search_users.dart';

export 'src/styles/colors.dart';
export 'src/styles/hex_color.dart';
export 'src/styles/text_styles.dart';

// TODO HANDY : src/utils
export 'src/utils/config_app.dart';
export 'src/utils/assets.dart';
export 'src/utils/failure.dart';
export 'src/utils/exception.dart';
export 'src/utils/network_utils.dart';

// TODO HANDY : PUBSPEC.YAML
export 'package:equatable/equatable.dart';
export 'package:flutter_bloc/flutter_bloc.dart';