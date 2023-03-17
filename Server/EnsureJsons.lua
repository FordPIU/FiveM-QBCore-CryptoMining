local function EnsurePlayers()
    local Players = {}

    FileManager:Set("Shared/Players.json", Players, true)
end

local function EnsureWarehouses()
    local Warehouses = {
        [1] = {
            LaptopCoords = vector3(994.51, -3099.96, -39.0),
            PricePerShelf = 10000,
            PricePerPowerIncrease = 1500,
            PricePerShelfUpgrade = 7500,
            MaxSlots = 360,
            NextAvailShelf = 1,
            Shelfs = {
                [1] = {
                    position = vector4(1003.68, -3093.03, -39.0, 359.01),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [2] = {
                    position = vector4(1006.08, -3093.07, -39.0, 356.64),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [3] = {
                    position = vector4(1008.53, -3093.05, -39.0, 359.2),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [4] = {
                    position = vector4(1010.91, -3093.04, -39.0, 357.53),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [5] = {
                    position = vector4(1013.28, -3093.02, -39.0, 358.36),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [6] = {
                    position = vector4(1015.7, -3093.05, -39.0, 0.24),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [7] = {
                    position = vector4(1018.13, -3093.03, -39.0, 359.16),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [8] = {
                    position = vector4(1003.63, -3095.52, -39.0, 178.27),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [9] = {
                    position = vector4(1006.02, -3095.48, -39.0, 179.9),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [10] = {
                    position = vector4(1008.42, -3095.49, -39.0, 184.72),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [11] = {
                    position = vector4(1010.83, -3095.44, -39.0, 177.07),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [12] = {
                    position = vector4(1013.27, -3095.56, -39.0, 177.35),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [13] = {
                    position = vector4(1015.63, -3095.56, -39.0, 182.42),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [14] = {
                    position = vector4(1017.98, -3095.49, -39.0, 181.79),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [15] = {
                    position = vector4(1003.68, -3098.53, -39.0, 1.27),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [16] = {
                    position = vector4(1006.08, -3098.48, -39.0, 6.76),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [17] = {
                    position = vector4(1008.49, -3098.5, -39.0, 2.42),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [18] = {
                    position = vector4(1010.9, -3098.48, -39.0, 358.32),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [19] = {
                    position = vector4(1013.3, -3098.48, -39.0, 359.83),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [20] = {
                    position = vector4(1015.77, -3098.45, -39.0, 1.98),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [21] = {
                    position = vector4(1018.2, -3098.42, -39.0, 355.44),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [22] = {
                    position = vector4(1003.62, -3101.39, -39.0, 180.45),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [23] = {
                    position = vector4(1005.97, -3101.39, -39.0, 179.31),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [24] = {
                    position = vector4(1008.37, -3101.39, -39.0, 188.35),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [25] = {
                    position = vector4(1010.74, -3101.39, -39.0, 185.47),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [26] = {
                    position = vector4(1013.23, -3101.37, -39.0, 179.83),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [27] = {
                    position = vector4(1015.66, -3101.39, -39.0, 183.49),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [28] = {
                    position = vector4(1018.05, -3101.43, -39.0, 191.57),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [29] = {
                    position = vector4(1003.62, -3104.32, -39.0, 0.88),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [30] = {
                    position = vector4(1006.15, -3104.36, -39.0, 8.34),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [31] = {
                    position = vector4(1008.47, -3104.37, -39.0, 358.45),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [32] = {
                    position = vector4(1010.94, -3104.37, -39.0, 359.39),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [33] = {
                    position = vector4(1013.28, -3104.38, -39.0, 1.98),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [34] = {
                    position = vector4(1015.74, -3104.35, -39.0, 359.59),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [35] = {
                    position = vector4(1018.17, -3104.31, -39.0, 0.17),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [36] = {
                    position = vector4(1003.56, -3107.16, -39.0, 186.36),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [37] = {
                    position = vector4(1006.01, -3107.07, -39.0, 181.97),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [38] = {
                    position = vector4(1008.49, -3107.12, -39.0, 179.19),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [39] = {
                    position = vector4(1010.84, -3107.11, -39.0, 185.12),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [40] = {
                    position = vector4(1013.31, -3107.12, -39.0, 180.76),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [41] = {
                    position = vector4(1015.67, -3107.18, -39.0, 180.15),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [42] = {
                    position = vector4(1017.99, -3107.16, -39.0, 188.85),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [43] = {
                    position = vector4(1003.69, -3109.94, -39.0, 0.6),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [44] = {
                    position = vector4(1006.07, -3109.95, -39.0, 4.48),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [45] = {
                    position = vector4(1008.46, -3109.93, -39.0, 3.82),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [46] = {
                    position = vector4(1010.86, -3109.97, -39.0, 11.29),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [47] = {
                    position = vector4(1013.3, -3109.95, -39.0, 1.41),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [48] = {
                    position = vector4(1015.69, -3109.94, -39.0, 2.58),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [49] = {
                    position = vector4(1018.2, -3109.95, -39.0, 0.94),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [50] = {
                    position = vector4(994.57, -3106.5, -39.0, 90.62),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [51] = {
                    position = vector4(994.68, -3108.93, -39.0, 96.65),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [52] = {
                    position = vector4(994.64, -3111.38, -39.0, 89.91),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [53] = {
                    position = vector4(1025.41, -3106.48, -39.0, 269.25),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [54] = {
                    position = vector4(1025.41, -3109.0, -39.0, 271.03),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [55] = {
                    position = vector4(1025.45, -3111.43, -39.0, 267.16),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [56] = {
                    position = vector4(1025.45, -3096.38, -39.0, 272.33),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [57] = {
                    position = vector4(1025.43, -3094.03, -39.0, 269.82),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                },
                [58] = {
                    position = vector4(1025.4, -3091.56, -39.0, 274.6),
                    usedData = {0, 0},
                    slots = 120,
                    maxPower = 1000,
                    isOwned = false,
                    ownerIndexer = nil,
                    bitData = {0, 0, -1},
                    slotUsage = {},
                    electricBill = 0
                }
            }
        }
    }

    FileManager:Set("Shared/Warehouses.json", Warehouses, true)
end

local function EnsurePurchaseables()
    local Purchaseables = {
        GPU = {
            ["Mrex 100"] = {
                Price = 100,
                BPM = 0.000009,
                PowerDraw = 10,
                SlotUsage = 1,
            },
            ["Mrex 120"] = {
                Price = 200,
                BPM = 0.000017,
                PowerDraw = 20,
                SlotUsage = 1,
            },
            ["Mrex 130"] = {
                Price = 300,
                BPM = 0.000022,
                PowerDraw = 30,
                SlotUsage = 1,
            },
            ["Mrex 140"] = {
                Price = 400,
                BPM = 0.000030,
                PowerDraw = 40,
                SlotUsage = 1,
            },
            ["Mrex 150"] = {
                Price = 500,
                BPM = 0.000040,
                PowerDraw = 50,
                SlotUsage = 1,
            },
            ["Mrex 160"] = {
                Price = 700,
                BPM = 0.000053,
                PowerDraw = 70,
                SlotUsage = 1,
            },
            ["Mrex 170"] = {
                Price = 900,
                BPM = 0.000070,
                PowerDraw = 90,
                SlotUsage = 1,
            },
            ["Mrex 180"] = {
                Price = 1200,
                BPM = 0.000094,
                PowerDraw = 120,
                SlotUsage = 1,
            },
            ["Mrex 190"] = {
                Price = 1600,
                BPM = 0.000125,
                PowerDraw = 160,
                SlotUsage = 1,
            },
            ["Mrex 230"] = {
                Price = 1800,
                BPM = 0.000131,
                PowerDraw = 180,
                SlotUsage = 1,
            },
            ["Mrex 240"] = {
                Price = 2300,
                BPM = 0.000164,
                PowerDraw = 230,
                SlotUsage = 1,
            },
            ["Mrex 250"] = {
                Price = 2900,
                BPM = 0.000205,
                PowerDraw = 290,
                SlotUsage = 1,
            },
            ["Mrex 260"] = {
                Price = 3600,
                BPM = 0.000256,
                PowerDraw = 360,
                SlotUsage = 1,
            },
            ["Mrex 270"] = {
                Price = 4500,
                BPM = 0.000320,
                PowerDraw = 450,
                SlotUsage = 1,
            },
            ["Mrex 280"] = {
                Price = 5600,
                BPM = 0.000400,
                PowerDraw = 560,
                SlotUsage = 1,
            },
            ["Mrex 290"] = {
                Price = 7000,
                BPM = 0.000500,
                PowerDraw = 700,
                SlotUsage = 1,
            },
            ["Mrex 310"] = {
                Price = 7500,
                BPM = 0.000430,
                PowerDraw = 750,
                SlotUsage = 1,
            },
            ["Mrex 320"] = {
                Price = 8400,
                BPM = 0.000478,
                PowerDraw = 840,
                SlotUsage = 1,
            },
            ["Mrex 330"] = {
                Price = 9300,
                BPM = 0.000531,
                PowerDraw = 930,
                SlotUsage = 1,
            },
            ["Mrex 340"] = {
                Price = 10300,
                BPM = 0.000590,
                PowerDraw = 1030,
                SlotUsage = 1,
            },
            ["Mrex 350"] = {
                Price = 11500,
                BPM = 0.000656,
                PowerDraw = 1150,
                SlotUsage = 1,
            },
            ["Mrex 360"] = {
                Price = 12800,
                BPM = 0.000729,
                PowerDraw = 1280,
                SlotUsage = 1,
            },
            ["Mrex 370"] = {
                Price = 14200,
                BPM = 0.000810,
                PowerDraw = 1420,
                SlotUsage = 1,
            },
            ["Mrex 380"] = {
                Price = 15800,
                BPM = 0.000900,
                PowerDraw = 1580,
                SlotUsage = 1,
            },
            ["Mrex 390"] = {
                Price = 17500,
                BPM = 0.001000,
                PowerDraw = 1750,
                SlotUsage = 1,
            }
        },
        ASIC = {
            ["Arars P01QB"] = {
                Price = 576000,
                BPM = 0.010000,
                PowerDraw = 11500,
                SlotUsage = 10,
            },
            ["Arars P02QB"] = {
                Price = 1728000,
                BPM = 0.020000,
                PowerDraw = 23000,
                SlotUsage = 10,
            },
            ["Arars P05QB"] = {
                Price = 4608000,
                BPM = 0.050000,
                PowerDraw = 57600,
                SlotUsage = 10,
            },
            ["Arars P075QB"] = {
                Price = 8928000,
                BPM = 0.075000,
                PowerDraw = 86400,
                SlotUsage = 10,
            },
            ["Arars P1QB"] = {
                Price = 14688000,
                BPM = 0.100000,
                PowerDraw = 115200,
                SlotUsage = 10,
            },
            ["Arars P25QB"] = {
                Price = 29088000,
                BPM = 0.250000,
                PowerDraw = 288000,
                SlotUsage = 10,
            },
            ["Arars P5QB"] = {
                Price = 57888000,
                BPM = 0.500000,
                PowerDraw = 576000,
                SlotUsage = 10,
            },
            ["Arars P7QB"] = {
                Price = 98208000,
                BPM = 0.700000,
                PowerDraw = 806400,
                SlotUsage = 10,
            },
            ["Arars 1QB"] = {
                Price = 155808000,
                BPM = 1.000000,
                PowerDraw = 1152000,
                SlotUsage = 10,
            },
            ["Arars 2QB"] = {
                Price = 271008000,
                BPM = 2.000000,
                PowerDraw = 2304000,
                SlotUsage = 10,
            },
            ["Arars 5QB"] = {
                Price = 559008000,
                BPM = 5.000000,
                PowerDraw = 5760000,
                SlotUsage = 10,
            },
            ["Arars 10QB"] = {
                Price = 1135008000,
                BPM = 10.000000,
                PowerDraw = 11520000,
                SlotUsage = 10,
            }
        }
    }

    FileManager:Set("Shared/Purchaseables.json", Purchaseables, true)
end

Citizen.CreateThread(function()
    local Players = FileManager:GetFromFile("Shared/Players.json")
    local Warehouses = FileManager:GetFromFile("Shared/Warehouses.json")
    local Purchaseables = FileManager:GetFromFile("Shared/Purchaseables.json")

    if Players == nil then
        EnsurePlayers()
    else
        FileManager:Load("Shared/Players.json")
    end
    if Warehouses == nil then
        EnsureWarehouses()
    else
        FileManager:Load("Shared/Warehouses.json")
    end
    if Purchaseables == nil then
        EnsurePurchaseables()
    else
        FileManager:Load("Shared/Purchaseables.json")
    end
end)

function ReloadJsons(src)
    TriggerClientEvent("CQB:MININGV2:Client::LoadData", src, {
        FileManager:Get("Shared/Warehouses.json"),
        FileManager:Get("Shared/Players.json"),
        FileManager:Get("Shared/Purchaseables.json")
    })
end