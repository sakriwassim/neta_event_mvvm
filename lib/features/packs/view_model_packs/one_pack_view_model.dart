
import '../models_packs/pack_model.dart';

class OnePackViewModel {
  PackModel? packModel;
  OnePackViewModel({this.packModel});
//PackModel

  get id => packModel?.id;
  get libelle => packModel?.libelle;
  get created_at => packModel?.created_at;
  get updated_at => packModel?.updated_at;
}
