return {
    {
        "hard-tender-blade/session-timer.nvim",
        dependencies = {
            "rcarriga/nvim-notify",
        },
        config = function()
            require("session-timer").setup({
                sessionTimeSeconds = 2700, -- 45 minutes
                showSessionEndWindow = true,
                onSessionStart = function()
                    require("notify")("Session started", "info", { timeout = 1000 })
                end,
                onSessionEnd = function() end,
                onSessionKill = function()
                    require("notify")("Session killed", "info", { timeout = 1000 })
                end,
                events = {
                    {
                        secondsBeforeSessionTimerEnds = 600, -- 10 minutes
                        hook = function()
                            require("notify")("Ending session in 10m", "info")
                        end
                    },
                    {
                        secondsBeforeSessionTimerEnds = 300, -- 5 minutes
                        hook = function()
                            require("notify")("Ending session in 5m", "info")
                        end
                    },
                    {
                        secondsBeforeSessionTimerEnds = 3,
                        hook = function()
                            require("notify")("Ending session in 3s", "info")
                        end
                    },
                    {
                        secondsBeforeSessionTimerEnds = 2,
                        hook = function()
                            require("notify")("Ending session in 2s", "info")
                        end
                    },
                    {
                        secondsBeforeSessionTimerEnds = 1,
                        hook = function()
                            require("notify")("Ending session in 1s", "info")
                        end
                    }
                }
            })
        end
    }
}
