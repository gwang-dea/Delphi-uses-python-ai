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