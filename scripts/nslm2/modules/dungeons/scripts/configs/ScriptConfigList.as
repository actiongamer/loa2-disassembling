package nslm2.modules.dungeons.scripts.configs
{
   import com.mz.core.utils.DictHash;
   
   public class ScriptConfigList
   {
      
      public static const TYPE_CHAPTER:int = 1;
      
      public static const TYPE_DUNGEON:int = 2;
      
      public static const TYPE_CITY:int = 3;
      
      private static var _ins:nslm2.modules.dungeons.scripts.configs.ScriptConfigList;
      
      public static const FIGHT_1_S:String = "fight_1_s";
      
      public static const FIGHT_1_E:String = "fight_1_e";
      
      public static const FIGHT_2_S:String = "fight_2_s";
      
      public static const FIGHT_2_E:String = "fight_2_e";
      
      public static const FIGHT_3_S:String = "fight_3_s";
      
      public static const FIGHT_3_E:String = "fight_3_e";
      
      public static const CHAPTER:String = "chapter";
      
      public static const CITY:String = "city";
       
      
      public var cmdList:DictHash;
      
      public var dgTimePointList:DictHash;
      
      public var cityTimePointList:DictHash;
      
      public var chapterTimePointList:DictHash;
      
      public var allTimePointList:DictHash;
      
      public function ScriptConfigList()
      {
         var _loc1_:* = null;
         cmdList = new DictHash();
         dgTimePointList = new DictHash();
         cityTimePointList = new DictHash();
         chapterTimePointList = new DictHash();
         super();
         dgTimePointList.put("fight_1_s","fight_1_s");
         dgTimePointList.put("fight_1_e","fight_1_e");
         dgTimePointList.put("fight_2_s","fight_2_s");
         dgTimePointList.put("fight_2_e","fight_2_e");
         dgTimePointList.put("fight_3_s","fight_3_s");
         dgTimePointList.put("fight_3_e","fight_3_e");
         chapterTimePointList.put("chapter","chapter");
         cityTimePointList.put("city","city");
         allTimePointList = dgTimePointList.merge(chapterTimePointList);
         _loc1_ = new ScriptConfigVo("delay","延迟",["time"],"两个脚本之间的间隔时间");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("branch","运行分支剧情",["url"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("end","终止脚本",[],"立即停止脚本,之后的脚本都不会运行");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("camera","移动镜头",["offX","x","speed","time"],"平移镜头;\nspeed是每秒移动的像素,为0则立即移动过去");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("effect3d","3D特效",["stc_special_effect_id","tempId","x","y","rotationX","rotationY","rotationZ","speed","time"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("delEffect3d","移除3D特效",["id"],"移除创建的3D特效");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("effect2d","flash特效",["url","tempId","x","y","from","to","loop","frameRate","hasButton"],"frameRate是每秒播放的帧数,默认60\nfrom是播放起始帧,默认从1开始\nto是播放终止帧不填则播放到最后一帧");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("delEffect2d","移除flash特效",["id"],"移除创建的2D特效");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("image","图片",["url","tempId","x","y","scaleX","scaleY","rotation","fade"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("delImage","移除图片",["id"],"移除创建的2D特效");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("tweenTo","平移",["id","speed","time","x","y","offX","offY"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("shake","震屏",["kind","frequency","range","duration"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("createNpc","创建临时NPC",["stc_npc_id","tempId","name","x","y","faceSide","rotation"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("deleteNpc","删除临时NPC",["id"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("showNpc","显示NPC",["id","x","y"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("hideNpc","隐藏NPC",["id"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("enterUnit","NPC入场",["id"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("moveTo","NPC行走到",["id","speed","x","y","side","pos"],"speed为0则默认速度;\n x y有值则移动到x,y的位置; \nside pos有值则移动到制定的位置;\nx y sidepos都没值,则移动到单位默认的pos上");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("faceSide","NPC朝向",["id","faceSide","rotation"],"side roation二选一;\nside有值则按照1:0度(朝左) 2:45度(左前) 3:90度(前) 4:135度 5:180度(朝右) 6:225度 7:270度(后方) 8:315度;\nrotation有值则旋转到指定值");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("action","NPC做动作",["id","name","loop","time"],"time有值则做time的时间,\ntime为0则使用做一次动作的时间");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("say2","角色说话(横幅)",["id","stc_npc_id","name","head_id","side","talk","time","fontColor","fontSize","fontBold"],"head_id是半身像id对应npc表的的head_id,\n没值则通过id读取;\n name是人物名,没有则通过id读取; \nid没有时,则head_id和name必须有值");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("filmSubtitle","电影字幕",["talk","time","fade","fontColor","fontSize","fontBold"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("changeBGM","改变背景音乐",["id"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
         _loc1_ = new ScriptConfigVo("newEnemyCome","新怪物出现",["id"],"");
         cmdList.put(_loc1_.cmd,_loc1_);
      }
      
      public static function get ins() : nslm2.modules.dungeons.scripts.configs.ScriptConfigList
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.dungeons.scripts.configs.ScriptConfigList();
         }
         return _ins;
      }
      
      public static function countDgScriptKey(param1:int, param2:Boolean) : String
      {
         return "fight_" + (param1 + 1) + "_" + (!!param2?"s":"e");
      }
   }
}
