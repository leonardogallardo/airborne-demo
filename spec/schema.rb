EVENT_SCHEMA = {
    id: :int,
    type: :string,
    beginDate: :date,
    endDate: :date,
    atTime: :date,
    category: :string,
    name: :string,
    office: :string,
    totalCost: :string
}

COST_SCHEMA = {
    currency: :string,
    value: :float,
    costCenter: {
        code: :int,
        description: :string,
        key: :string
    }
}
