package nslm2.modules.cultivates.pet.view.render
{
   import game.ui.petModule.comps.PetListRenderUI;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   import morn.customs.FilterLib;
   import nslm2.common.ctrls.TSM;
   
   public class PetListRendr extends PetListRenderUI
   {
       
      
      public var ori_img_quality_skin:String;
      
      private var _data:PetInfoVo;
      
      private var tsms:TSMDict;
      
      private var petModel:PetModel;
      
      public function PetListRendr()
      {
         petModel = PetModel.ins;
         super();
         tsms = new TSMDict();
         tsms.addTSM(new TSM(this.img_using,0.3).addState(1,{"alpha":1}).addState(2,{"alpha":0}).addState(3,{"alpha":0}).addState(404,{"alpha":0}));
         tsms.addTSM(new TSM(this.img_lock,0.3).addState(1,{"alpha":0}).copyState(2,1).copyState(3,1).copyState(404,0));
         ori_img_quality_skin = this.img_quality.skin.substr(0,this.img_quality.skin.length - 1);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as PetInfoVo;
         img_lock.visible = false;
         redPoint.visible = false;
         if(_data)
         {
            img_icon.url = UrlLib.headIcon(_data.stcVo.head_id);
            img_quality.url = ori_img_quality_skin + _data.stcVo.quality;
            img_lock.visible = true;
            updateStatus();
            this.toolTip = _data;
         }
         else
         {
            this.toolTip = null;
         }
         .super.dataSource = param1;
      }
      
      private function updateStatus() : void
      {
         var _loc1_:Boolean = false;
         if(petModel.getPetInfo(_data.id))
         {
            if(petModel.onBattlePetID == _data.id)
            {
               tsms.toState(1);
               this.img_quality.filters = null;
               this.img_icon.filters = null;
            }
            else
            {
               tsms.toState(2);
               this.img_quality.filters = null;
               this.img_icon.filters = null;
            }
            if(_data.petInfo.position > 0 || petModel.onBattlePetID == _data.id)
            {
               if(PetUtil.checkSinglePet(_data.petInfo))
               {
                  redPoint.visible = true;
               }
            }
            if(_data.petInfo && _data.petInfo.position > 0 && _data.petInfo.position < 7)
            {
               this.img_protect.visible = true;
            }
            else
            {
               this.img_protect.visible = false;
            }
         }
         else
         {
            this.img_protect.visible = false;
            _loc1_ = PetUtil.checkCanCompose(_data.id);
            if(_loc1_)
            {
               tsms.toState(3);
               this.img_quality.filters = null;
               this.img_icon.filters = null;
               redPoint.visible = true;
            }
            else
            {
               tsms.toState(404);
               this.img_quality.filters = FilterLib.ins.getFilterArr(401);
               this.img_icon.filters = FilterLib.ins.getFilterArr(401);
            }
         }
      }
   }
}
