module PositionsHelper
    def career_name(career)
        I18n.t('activerecord.attributes.position.careers')[career.to_sym]
    end

    def contract_name(contract)
        I18n.t('activerecord.attributes.position.contracts')[contract.to_sym]
    end

    def modality(position)
        position.remote ? 'Remoto' : 'Presencial'
    end

    def text_position(position)
        "A Empresa #{position.company.name} em #{position.city} está com vaga de #{position.name}. Veja mais detalhes no nosso mural! #{url_position(position)}"
    end

    def url_position(position)
        public_position_url(position.slug)
    end
end
