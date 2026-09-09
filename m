Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07929AAEA
	for <io-uring@vger.kernel.org>; Wed,  9 Sep 2026 01:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788916518; cv=none; b=GA/O3etueyVtN6wZr5LZAGmQAviZIf5IfJItE4Ipnu2AJPH5CPTZW8b3rXmoSiNrcFRDceJfROSMNMac0SDmZQsHjiSmSWzw0pkBFa3gCCuzWI4zlMiRcixRSRa9DnGiAr7exNmOmsaDK4S5aWM6GJOv/YqdtgJcxIbdH+yp+gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788916518; c=relaxed/simple;
	bh=z88fBECguwFUQ3oqHlOVu8JMuEaPOtdR+gKmUFDZRQA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=GLUygiH8J6yY/fyVohWEq7KzlfMD6oFWqtqjlvo4YeboGIgA6Q8TiRZ5+Bvj8i8G7g/PmJmJHXHszd7f0gRcIT8YGWjgYoMhB7EhS48hHc69h0+Zev+hLcQaPvMVN7NEseQ/T5oYfBvB7u362aSAyTW97INUJu+O/9ZKep+BeOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=zCJZb78p; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="zCJZb78p"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4f1354074so308204a34.0
        for <io-uring@vger.kernel.org>; Tue, 08 Sep 2026 18:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1788916516; x=1789521316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C0F+BhJXWav79HJUvCDEB8apDuPRzW6Sy5FYxm9DXY8=;
        b=zCJZb78pZbogNRl6478FadGCvHkH3DSVPHCVkwxsJeIWNmnsuHjejJEDQRV0tXcq5W
         J1LvDH9Fa7OyX/+I+Y2fzPgapAOdOCkYGJtfHNRUEHPGMFYJiNsjIz6MWN8Heyj0Gh+1
         g/SfhEXdZ+ysdKncLzXYgUXoM6o0buD1agMO04ECfN5J23MvZb8TFDUMZ6qhll38/R6f
         ov5ZFUPpVEtp2BIWVZfQDwRFSvdNx9izQwvShQWvUb13KQD+orZvzeEdc2SnJ9U9uaCf
         x2OWi0akDWHh2OfD8gkGkXLsBkVh7eUAiM6QZ868QsHowevjig3nEi3i3JTYwmUd+rrj
         Judw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788916516; x=1789521316;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C0F+BhJXWav79HJUvCDEB8apDuPRzW6Sy5FYxm9DXY8=;
        b=rjcNj2ZwonYfTXOtMQCQgSlL13eW1fLeM9Ctfm89piWVoRX1U55Ro0rzbPGwRRLlo0
         HVCkqtVQ8B+W7Seb/o0oXsVYcyP5D9sNYjTPoAsrR4n2Ig2obSSShj7PCZq1VlAAUH3H
         g66tkFzoAvR6WUkXiFcDI1Mfhvx/eaZvIFDwngriTgSbvqbhud7WWrKCqKgJoSPmdyA7
         0mqaT8lFVimvchBmR4Doq2zF1oT6hyzbVgevgR7unPigio+yC8mVVAI2Q/SLAd1L3OVJ
         mcpy+PR+mB5fBjMOG6NiGWW+kfWnZh7zO1Pvr6ru2SK5SeccRCnIJyR4n4kIkEqA+WtJ
         fzRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCmYLjK6CzGLkLca9ugJDmpAOwcn6iz3MZOfEABGdJKNHAQkNy90nIpgClNSTMkFUba1dr4Fi32g==@vger.kernel.org
X-Gm-Message-State: AFuF++kl6tVwR8A9sXGOmWkJu+XNfqSImJTOFaltY3QxaXttZTDsnLw9
	1A6DwbR4OnrgsGkf9zm1Vr/hojgozyZGUDVNY75xus0/XRsqHkznN3F7Bc0Pl00pQDI=
X-Gm-Gg: AYBFou2Qr3ijxteAFHMLcmPUHXhW2EV/nRzjWteFhyzAbi0rFCX1sDfqYBk5tPq1hUH
	ymWOSvJB5r4XJZx2wW2sCeUmfsUNMqayCphtS6F9SjfEuRZ3hUKpTZIaK7nnEKxfwsE+d/Jj/OW
	f8Unc3ch+N666j0MmvaalJlHB6+VGglwBzr+yhTzA7VISK/wrd6b8pja8WGR5SmJusTfmqizPZx
	KSIN+mQRAHsttDOLBOQjzQ3BmncU0dHGUYsYbcxbbtuJZhGBxkmNYFHYvyhyTlsEuyOqfbfSXiE
	DMRKvIToKEBizb5nxAUjIAQyTBiu+HRSpV/SO/plc/O7Ce+z3gwO9DtlMokeZq1cycG8jGUfiYP
	N+WcF6LwS69Qzv0VfUnFkybeNwPpmFR72rAp43KvSTr/Cgaa2saPFDEtD5o7kJ+VOqM1DznkZwP
	w+0ixaKjr59b861CwkN16dhyGZLYavXg3zUYlVpxdYC/jjJG9E+UPDgCDDtDPMEAvKEkAILC0Ij
	2oYVpgW/kq4Td59LKSmvTscDA/wJCCJqKLAw45z221swnDPqa5UP6lUsg==
X-Received: by 2002:a05:6820:8595:10b0:6bd:fd44:9045 with SMTP id 006d021491bc7-6bdfd4498c6mr636514eaf.3.1788916515696;
        Tue, 08 Sep 2026 18:15:15 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm18374727eaf.5.2026.09.08.18.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 18:15:14 -0700 (PDT)
Message-ID: <b191cba9-d863-4bfc-8729-be60cf66f1d7@kernel.dk>
Date: Tue, 8 Sep 2026 19:15:13 -0600
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] [ext4?] INFO: task hung in io_write
From: Jens Axboe <axboe@kernel.dk>
To: syzbot <syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6aa0876e.f81106d8.285f0a.0005.GAE@google.com>
 <31ab7ab6-2cf5-4fcb-a6cb-05fab461e742@kernel.dk>
Content-Language: en-US
In-Reply-To: <31ab7ab6-2cf5-4fcb-a6cb-05fab461e742@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-7.3

Forgot to push it out... Let's kick it again.

-- 
Jens Axboe

