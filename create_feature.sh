#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./create_feature.sh feature_name"
  exit 1
fi

FEATURE_NAME=$1
BASE_PATH="lib/features/$FEATURE_NAME"
CUBIT_PATH="$BASE_PATH/cubit"
DATA_PATH="$BASE_PATH/data"
PRESENTATION_PATH="$BASE_PATH/presentation"

mkdir -p "$CUBIT_PATH"
mkdir -p "$DATA_PATH"
mkdir -p "$PRESENTATION_PATH"

# Convert to snake_case just in case (e.g., MyFeature -> my_feature)
FILE_NAME=$(echo "$FEATURE_NAME" | sed 's/\([A-Z]\)/_\L\1/g' | sed 's/^_//')

# Capitalized feature name for class names (e.g., dashboard -> Dashboard)
CAP_FEATURE="$(tr '[:lower:]' '[:upper:]' <<< ${FEATURE_NAME:0:1})${FEATURE_NAME:1}"

# Create cubit file
cat > "$CUBIT_PATH/${FILE_NAME}_cubit.dart" <<EOF
import 'package:supply_to_trade/core/base/i_cubit.dart' show ICubit;
import 'package:supply_to_trade/features/${FEATURE_NAME}/data/${FEATURE_NAME}_state.dart'
    show ${CAP_FEATURE}State;

/// Cubit for the ${CAP_FEATURE} feature.
class ${CAP_FEATURE}Cubit extends ICubit<${CAP_FEATURE}State> {
/// Const constructor for ${CAP_FEATURE} cubit
  ${CAP_FEATURE}Cubit() : super(const ${CAP_FEATURE}State());
}
EOF

# Create state file (in data/)
cat > "$DATA_PATH/${FILE_NAME}_state.dart" <<EOF
import 'package:supply_to_trade/core/base/i_state.dart' show IState;

/// State for the ${CAP_FEATURE} feature.
class ${CAP_FEATURE}State extends IState<${CAP_FEATURE}State> {
/// Const constructor for ${CAP_FEATURE} state
const ${CAP_FEATURE}State({super.isLoading = false});

  @override
  ${CAP_FEATURE}State copyWith({bool? isLoading}) {
    return ${CAP_FEATURE}State(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get additionalProps => [];

  @override
  ${CAP_FEATURE}State reset() {
    // TODO:  implement reset
    throw UnimplementedError();
  }
}
EOF

# Create page file
cat > "$PRESENTATION_PATH/${FILE_NAME}_page.dart" <<EOF
import 'package:flutter/material.dart';

/// Page for the ${CAP_FEATURE} feature.
class ${CAP_FEATURE}Page extends StatelessWidget {
/// Const constructor for ${CAP_FEATURE} page
  const ${CAP_FEATURE}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('${CAP_FEATURE}')),
      body: const Center(
        child: Text('${CAP_FEATURE} Page'),
      ),
    );
  }
}
EOF

echo "✅ Feature '$FEATURE_NAME' created with:"
echo "  - cubit/${FILE_NAME}_cubit.dart"
echo "  - data/${FILE_NAME}_state.dart"
echo "  - presentation/${FILE_NAME}_page.dart"
