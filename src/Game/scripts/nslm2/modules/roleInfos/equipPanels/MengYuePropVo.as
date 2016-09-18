package nslm2.modules.roleInfos.equipPanels
{
   import proto.PanelBaseInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   import com.mz.core.utils.ArrayUtil;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class MengYuePropVo
   {
       
      
      public var mengYueId:int;
      
      public var stcMengyueVo:StcMengyueVo;
      
      public var propVo:NpcPropVo;
      
      public var name:String;
      
      public var des:String;
      
      public var htmlDes:String;
      
      public var isActivate:Boolean;
      
      public var heroBaseInfo:PanelBaseInfo;
      
      private var _htmlDes:String = "";
      
      public function MengYuePropVo(param1:StcMengyueVo)
      {
         super();
         this.mengYueId = param1.id;
         this.stcMengyueVo = param1;
         this.name = LocaleMgr.ins.getStr(stcMengyueVo.name);
         this.des = LocaleMgr.ins.getStr(stcMengyueVo.desc);
         this.propVo = NpcPropVo.parseStr(stcMengyueVo.attr);
      }
      
      public static function idArrToVoArr(param1:int, param2:Array, param3:PanelBaseInfo = null, param4:int = -1) : Array
      {
         var _loc9_:* = null;
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc10_:int = 0;
         var _loc5_:Array = [];
         if(param4 == -1)
         {
            _loc9_ = StcMgr.ins.getVoArrByColumnValue("static_mengyue","node",param1);
         }
         else
         {
            _loc9_ = StcMgr.ins.getVoArrByMultiColumnValue("static_mengyue",["node","kind"],[param1,param4]);
         }
         var _loc8_:int = _loc9_.length;
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc7_ = _loc9_[_loc10_];
            _loc6_ = new MengYuePropVo(_loc7_);
            _loc6_.heroBaseInfo = param3;
            if(param2.indexOf(_loc7_.id) >= 0)
            {
               _loc6_.isActivate = true;
            }
            _loc5_.push(_loc6_);
            _loc10_++;
         }
         return _loc5_;
      }
      
      public static function getActivateMengYueCnt(param1:int, param2:Array, param3:int = -1) : int
      {
         var _loc5_:int = 0;
         var _loc8_:* = null;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc9_:int = 0;
         if(param3 == -1)
         {
            _loc8_ = StcMgr.ins.getVoArrByColumnValue("static_mengyue","node",param1);
         }
         else
         {
            _loc8_ = StcMgr.ins.getVoArrByMultiColumnValue("static_mengyue",["node","kind"],[param1,param3]);
         }
         var _loc7_:int = _loc8_.length;
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _loc6_ = _loc8_[_loc9_];
            if(param2.indexOf(_loc6_.id) >= 0)
            {
               _loc5_++;
            }
            _loc9_++;
         }
         return _loc5_;
      }
      
      public static function getMengYueIndex(param1:int, param2:int) : int
      {
         var _loc3_:Array = StcMgr.ins.getVoArrByColumnValue("static_mengyue","node",param1);
         return ArrayUtil.indexByAttr(_loc3_,"id",param2);
      }
      
      public static function getMaxMengYueCnt(param1:int) : int
      {
         return StcMgr.ins.getVoArrByColumnValue("static_mengyue","node",param1).length;
      }
      
      public function getHtmlDes() : String
      {
         if(_htmlDes == "")
         {
            _htmlDes = NpcPropVo.changePrecentTxtToOrange(this.des);
         }
         return _htmlDes;
      }
   }
}
