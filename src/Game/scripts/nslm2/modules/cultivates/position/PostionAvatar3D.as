package nslm2.modules.cultivates.position
{
   import nslm2.modules.scenes.commons.Unit3DBase;
   import proto.BuZhen;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.Event;
   import com.greensock.TweenLite;
   import flash.geom.Point;
   import nslm2.common.model.HeroModel;
   import proto.PanelBaseInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import proto.HeroInfo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import com.mz.core.mgrs.UIMgr;
   
   public class PostionAvatar3D extends Unit3DBase
   {
       
      
      private var _data:BuZhen;
      
      public var oriPoint:Point;
      
      private var oldBaseId:int;
      
      public function PostionAvatar3D()
      {
         super();
         this.actStd = "std_2";
         this.box3D2.scaleAll = DefindConsts.SCENE_AVATAR_SCALE_POSITION / DefindConsts.SCENE_AVATAR_SCALE_SCENE;
         UIMgr.stage.addEventListener("mouseOver",layer2D_onRollOver);
      }
      
      private function layer2D_onRollOver(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide");
      }
      
      override protected function avatar_mouseOver3D(param1:Event) : void
      {
         super.avatar_mouseOver3D(param1);
         ObserverMgr.ins.sendNotice("msg_tooltip_show",new TooltipPositionVo(panelBaseInfo));
      }
      
      override protected function avatar_mouseOut3D(param1:Event) : void
      {
         super.avatar_mouseOut3D(param1);
         ObserverMgr.ins.sendNotice("msg_tooltip_hide");
      }
      
      override protected function avatar_mouseDown3D(param1:Event) : void
      {
         super.avatar_mouseDown3D(param1);
         ObserverMgr.ins.sendNotice("msg_tooltip_hide");
      }
      
      public function resetPos(param1:Boolean) : void
      {
         if(param1)
         {
            TweenLite.to(this,0.3,{
               "x":this.oriPoint.x,
               "y":this.oriPoint.y
            });
            this.z = this.oriPoint.y;
            countZ();
         }
         else
         {
            this.x = this.oriPoint.x;
            this.y = this.oriPoint.y;
            this.z = this.oriPoint.y;
            countZ();
         }
      }
      
      public function setXY(param1:Number, param2:Number) : void
      {
         this.x = param1;
         this.y = param2;
         oriPoint = new Point(param1,param2);
         countZ();
      }
      
      private function countZ() : void
      {
         this.z = this.oriPoint.y * 2 + 300;
      }
      
      public function get data() : BuZhen
      {
         return _data;
      }
      
      public function set data(param1:BuZhen) : void
      {
         _data = param1;
         if(param1 == null)
         {
            this.dispose();
         }
         else
         {
            initAvatar(baseId);
         }
      }
      
      public function get isUser() : Boolean
      {
         return HeroModel.ins.isCurPlayerHero(data.id);
      }
      
      public function get baseId() : uint
      {
         if(isUser)
         {
            return HeroModel.ins.playerHero.baseInfo.baseId;
         }
         var _loc3_:int = 0;
         var _loc2_:* = HeroModel.ins.panelBaseInfoList;
         for each(var _loc1_ in HeroModel.ins.panelBaseInfoList)
         {
            if(Uint64Util.equal(_loc1_.id,_data.id))
            {
               return _loc1_.baseId;
            }
         }
         return -1;
      }
      
      public function get panelBaseInfo() : PanelBaseInfo
      {
         var _loc3_:int = 0;
         var _loc2_:* = HeroModel.ins.panelBaseInfoList;
         for each(var _loc1_ in HeroModel.ins.panelBaseInfoList)
         {
            if(Uint64Util.equal(_loc1_.id,_data.id))
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function initAvatar(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = 0;
         if(oldBaseId != param1)
         {
            this.tag3DVBox.initBg();
            _loc4_ = StcMgr.ins.getNpcVo(param1);
            _loc2_ = HeroModel.ins.getHeroInfoQuick(_data.id);
            initByStcNpcId(param1,false,!!_loc2_?_loc2_.baseInfo.skin:0);
            if(HeroModel.ins.isCurPlayerHero(data.id))
            {
               _loc3_ = uint(ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank)));
            }
            else
            {
               _loc3_ = uint(ColorLib.qualityColor(_loc4_.quality));
            }
            this.tag3DVBox.initName(HeroInfoUtil.getName(data.id,this.baseId) + "\n" + TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000081) + panelBaseInfo.mengyue.length + "/" + DefindConsts.MAX_YUANFEN_COUNT,458496),_loc3_);
            this.tag3DVBox.y = 185;
            if(!isUser)
            {
               this.tag3DVBox.initCareer(_loc4_.career_id);
               this.tag3DVBox.initGroup(_loc4_.group);
            }
         }
         oldBaseId = param1;
      }
      
      override public function dispose() : void
      {
         UIMgr.stage.removeEventListener("mouseOver",layer2D_onRollOver);
         super.dispose();
      }
   }
}
