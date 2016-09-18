package nslm2.modules.scenes.mainCitys
{
   import game.ui.resourceDg.ResBossRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.mgrs.stcMgrs.vos.StcHeropracticeNanduVo;
   import proto.HeroPracticeNanduInfo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.common.model.PlayerModel;
   import morn.customs.FilterLib;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.ui.components.comps2d.others.RedPointNum;
   
   public class ResBossRender extends ResBossRenderUI implements IObserver
   {
       
      
      private var _redPointNum:RedPointNum;
      
      public function ResBossRender()
      {
         super();
         this.buttonMode = true;
         this.mouseChildren = false;
         this.txt_tip.text = "";
      }
      
      public function get vo() : StcHeropracticeNanduVo
      {
         return _dataSource.stc as StcHeropracticeNanduVo;
      }
      
      public function get serVo() : HeroPracticeNanduInfo
      {
         return _dataSource.ser as HeroPracticeNanduInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         .super.dataSource = param1;
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
            showOrHideRedPoint(false);
            _loc3_ = StcMgr.ins.getNpcGroupVo(vo.npcgroup);
            this.txt_name.text = LocaleMgr.ins.getStr(_loc3_.name);
            this.img_icon.skin = UrlLib.headIcon(_loc3_.head_id + "");
            this.txt_title.text = LocaleMgr.ins.getStr(vo.name);
            if(vo.locklevel > PlayerModel.ins.level)
            {
               this.txt_tip.text = LocaleMgr.ins.getStr(41400007,[vo.locklevel]);
               this.txt_tip.color = 16723968;
               this.img_bb.visible = true;
               img_icon.filters = FilterLib.ins.getFilterArr(402);
            }
            else if(serVo.state == 3)
            {
               this.img_bb.visible = true;
               this.txt_tip.text = LocaleMgr.ins.getStr(41400015);
               this.txt_tip.color = 16723968;
               img_icon.filters = FilterLib.ins.getFilterArr(402);
            }
            else if(serVo.state == 2)
            {
               this.img_bb.visible = false;
               img_icon.filters = [];
               this.txt_tip.text = "";
            }
            else
            {
               this.txt_tip.text = LocaleMgr.ins.getStr(41400006);
               this.img_bb.visible = true;
               this.txt_tip.color = 458496;
               img_icon.filters = [];
               if(_dataSource.isLastTongguan)
               {
                  showOrHideRedPoint(true);
               }
               else
               {
                  showOrHideRedPoint(false);
               }
            }
            _loc2_ = (vo.sort - 1) % 3 + 2;
            WealthUtil.changeQualitySkin(this.img_quality,_loc2_);
            txt_name.color = ColorLib.qualityColor(_loc2_);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      private function showOrHideRedPoint(param1:*) : void
      {
         if(param1)
         {
            if(_redPointNum == null)
            {
               _redPointNum = new RedPointNum();
               _redPointNum.top = 20;
               _redPointNum.right = -2;
               this.addChild(_redPointNum);
            }
            _redPointNum.count = _dataSource.nodeRes.shengyutimes;
         }
         else if(_redPointNum)
         {
            _redPointNum.dispose();
            _redPointNum = null;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_NPC_FUNC_VO_CHANGE","RES_DG_SWITCH_BOSS_FIGHT_CURSOR"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" !== _loc3_)
         {
            if("RES_DG_SWITCH_BOSS_FIGHT_CURSOR" === _loc3_)
            {
               if(_redPointNum)
               {
                  _redPointNum.count = _dataSource.nodeRes.shengyutimes;
               }
            }
         }
         else if(_dataSource.isLastTongguan && param2 as int == 41400)
         {
            showOrHideRedPoint(true);
         }
      }
   }
}
