function GetKislevSubcultureResources()
    return {
        DefaultLords = {"ksl_lord"},
        Rewards = {

        },
        Heroes = {
            "emp_bright_wizard",
            "emp_captain",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
        },
        AgentSubTypes = {
            ksl_lord = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            emp_bright_wizard = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            emp_captain = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
    };
end