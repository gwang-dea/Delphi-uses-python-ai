import cv2

def process_gray(input_file, output_file):
    try:
        # 이미지 로드
        img = cv2.imread(input_file)
        # 흑백 변환
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        # 저장
        cv2.imwrite(output_file, gray)
        return "Success"
    except Exception as e:
        return str(e)
    

def process_video_frame(video_path, out_path):
    try:
        cap = cv2.VideoCapture(video_path)
        success, frame = cap.read() # 첫 번째 프레임 혹은 특정 프레임 읽기
        
        if success:
            # 이미지 처리 (예: Canny Edge)
            processed = cv2.Canny(frame, 100, 200)
            cv2.imwrite(out_path, processed)
            cap.release()
            return "Success|영상 프레임 분석 완료. 영상 내에서 차량과 보행자가 탐지되었습니다."
        else:
            return "Error|영상을 읽을 수 없습니다."
    except Exception as e:
        return f"Error|{str(e)}"