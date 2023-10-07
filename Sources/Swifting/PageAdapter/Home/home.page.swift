import ScadeKit
import Services
  
final class HomePageAdapter: BasePageAdapter<HomePageViewModel> {
	
	override func configUI() {
        mainList.elementProvider = SCDWidgetsElementProvider { (item: SwiftEvolutionEntity, template) in
            (template.getWidgetByName("statusLabel") as? SCDWidgetsLabel)?.text = item.status.transformedState
            (template.getWidgetByName("titleLabel") as? SCDWidgetsLabel)?.text = item.title
        }
	}
		
	override func bind() {
        viewModel.networkingAction {
            self.mainList.items = self.viewModel.swiftEvolution
        }
		mainList.onItemSelected.append(
			SCDWidgetsItemSelectedEventHandler { event in
				guard let item = event?.item as? SwiftEvolutionEntity else { return }
				self.viewModel.listItemSelect(item.link)
			}
		)
	}
}
