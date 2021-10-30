import React from "react"

import { AuthenticatedUserProvider } from "./AuthenticatedUserProvider"
import RootNavigator from "./RootNavigator"

/**
 * Wrap all providers here
 */

function Routes() {
    return (
        <AuthenticatedUserProvider>
            <RootNavigator />
        </AuthenticatedUserProvider>
    )
}

export default Routes